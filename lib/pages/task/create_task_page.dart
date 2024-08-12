import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/core/theme/core_text_styles.dart';
import 'package:tasko/stores/task/create/create_task_store.dart';
import 'package:tasko/widgets/main_button_widget.dart';
import 'package:tasko/widgets/main_input_textfield_widget.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateTaskStore store = CreateTaskStore();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Task',
          style: TextStyle(color: CoreColors.coreWhite),
        ),
        backgroundColor: CoreColors.dropdownBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: CoreColors.coreWhite,
          onPressed: store.onTapBackButton,
        ),
      ),
      backgroundColor: CoreColors.coreBackground,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Container(
            height: constraints.maxHeight,
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add a new task",
                    style: CoreTextStyles.publicSans(
                      fontSize: 32,
                      fontWeight: FontWeightEnum.bold_700,
                      color: CoreColors.primaryTextColor,
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 32),
                      Column(
                        children: [
                          MainInputTextFieldWidget(
                            hintText: "Task title",
                            label: "Title",
                            controller: store.titleController,
                          ),
                          const SizedBox(height: 24),
                          MainInputTextFieldWidget(
                            maxLines: 5,
                            keyboardType: TextInputType.visiblePassword,
                            hintText: "Description of the task",
                            label: "Description",
                            controller: store.descriptionController,
                          ),
                          const SizedBox(height: 64),
                          Observer(
                            builder: (_) => IgnorePointer(
                              ignoring: store.titleController.text.isEmpty ||
                                  store.descriptionController.text.isEmpty,
                              child: MainButtonWidget(
                                onPressed: store.createTask,
                                title: "Create Task",
                                isLoading: store.isLoading,
                                type: store.titleController.text.isNotEmpty &&
                                        store.descriptionController.text
                                            .isNotEmpty
                                    ? ButtonTypes.primary
                                    : ButtonTypes.secondary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
