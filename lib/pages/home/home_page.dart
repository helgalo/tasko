import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/pages/home/home_controller.dart';
import 'package:tasko/widgets/main_checkbox_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: CoreColors.coreWhite),
        ),
        backgroundColor: CoreColors.dropdownBackgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: CoreColors.coreRed,
            onPressed: () {
              homeController.logout();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeController.onTapCreateTask,
        child: const Icon(
          Icons.add,
          color: CoreColors.corePrimary,
        ),
      ),
      backgroundColor: CoreColors.coreBackground,
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Observer(
                        builder: (context) => ListView.builder(
                          itemCount: homeController.tasks.length,
                          itemBuilder: (context, index) => CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => homeController
                                .goToDetailsPage(homeController.tasks[index]),
                            child: Column(
                              children: [
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Text(
                                      homeController.tasks[index].title,
                                      style: const TextStyle(
                                        color: CoreColors.coreWhite,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
