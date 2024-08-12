import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/stores/home/home_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeStore store = HomeStore();

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
              store.logout();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CoreColors.corePrimary,
        onPressed: store.onTapCreateTask,
        child: const Icon(
          Icons.add,
          color: CoreColors.coreWhite,
        ),
      ),
      backgroundColor: CoreColors.coreBackground,
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
                                  itemCount: store.tasks.length,
                                  itemBuilder: (context, index) =>
                                      CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () => store
                                        .goToDetailsPage(store.tasks[index]),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Text(
                                              store.tasks[index].title,
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
      ),
    );
  }
}
