import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/pages/task/details/task_details_controller.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskDetailsController provider = TaskDetailsController();

    return Scaffold(
      backgroundColor: CoreColors.coreBackground,
      appBar: AppBar(
        title: Observer(
          builder: (_) => provider.isLoading
              ? const CircularProgressIndicator()
              : Text(
                  'Task: ${provider.actualTask?.title}',
                  style: const TextStyle(color: CoreColors.coreWhite),
                ),
        ),
        backgroundColor: CoreColors.dropdownBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: CoreColors.coreWhite,
          onPressed: provider.onTapBackButton,
        ),
      ),
      body: Observer(
        builder: (_) => provider.isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Name: ",
                          style: TextStyle(
                              fontSize: 20, color: CoreColors.infoTextColor3)),
                      Text(provider.actualTask?.title ?? '',
                          style: const TextStyle(
                              fontSize: 20, color: CoreColors.coreWhite)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Description: ",
                          style: TextStyle(
                              fontSize: 20, color: CoreColors.infoTextColor3)),
                      Text(provider.actualTask?.description ?? '',
                          style: const TextStyle(
                              fontSize: 20, color: CoreColors.coreWhite)),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
