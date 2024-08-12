import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/pages/task/details/task_details_store.dart';
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
        builder: (context, constraints) => SingleChildScrollView(
          child: SizedBox(
            height: constraints.maxHeight,
            child: Observer(
              builder: (_) => store.isLoading
                  ? const Center(
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator()))
                  : Padding(
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  label: 'Description',
                                  hintText: "Task description",
                                  controller: store.descriptionController,
                                  onChanged: (_) => store.onChangeTask(),
                                ),
                                const SizedBox(height: 64),
                                Observer(
                                  builder: (_) => IgnorePointer(
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
