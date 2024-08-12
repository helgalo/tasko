import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/stores/task/details/task_details_store.dart';
import 'package:tasko/widgets/main_button_widget.dart';
import 'package:tasko/widgets/main_input_textfield_widget.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskDetailsStore store = TaskDetailsStore();

    return Scaffold(
      backgroundColor: CoreColors.coreBackground,
      appBar: AppBar(
        title: Observer(
          builder: (_) => store.isLoading
              ? const CircularProgressIndicator()
              : Text(
                  'Task: ${store.actualTask?.title}',
                  style: const TextStyle(color: CoreColors.coreWhite),
                ),
        ),
        backgroundColor: CoreColors.dropdownBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: CoreColors.coreWhite,
          onPressed: store.onTapBackButton,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Observer(
          builder: (context) => Center(
            child: store.isLoading
                ? const SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      height: constraints.maxHeight,
                      child: store.isLoading
                          ? const Center(
                              child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator()))
                          : SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      MainInputTextFieldWidget(
                                        label: 'Name',
                                        hintText: "Task name",
                                        controller: store.nameController,
                                        onChanged: (_) => store.onChangeTask(),
                                      ),
                                      const SizedBox(height: 24),
                                      MainInputTextFieldWidget(
                                        maxLines: 5,
                                        label: 'Description',
                                        hintText: "Task description",
                                        controller: store.descriptionController,
                                        onChanged: (_) => store.onChangeTask(),
                                      ),
                                      const SizedBox(height: 64),
                                      IgnorePointer(
                                        ignoring: !store.hasChanges,
                                        child: MainButtonWidget(
                                          onPressed: store.updateTask,
                                          title: 'Update Task',
                                          isLoading: store.isLoading,
                                          type: store.hasChanges
                                              ? ButtonTypes.primary
                                              : ButtonTypes.secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
