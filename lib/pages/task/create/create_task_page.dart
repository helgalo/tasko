import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/core/theme/core_text_styles.dart';
import 'package:tasko/pages/task/create/create_task_controller.dart';
import 'package:tasko/widgets/main_button_widget.dart';
import 'package:tasko/widgets/main_input_textfield_widget.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateTaskController provider = CreateTaskController();

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
          onPressed: provider.onTapBackButton,
        ),
      ),
      backgroundColor: CoreColors.coreBackground,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Task",
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
                          controller: provider.titleController,
                        ),
                        const SizedBox(height: 24),
                        MainInputTextFieldWidget(
                          keyboardType: TextInputType.visiblePassword,
                          hintText: "Description of the task",
                          label: "Description",
                          controller: provider.descriptionController,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
                Observer(
                  builder: (_) => MainButtonWidget(
                    onPressed: provider.createTask,
                    title: "Create Task",
                    isLoading: provider.isLoading,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
