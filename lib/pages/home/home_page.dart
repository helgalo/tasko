import 'package:flutter/material.dart';
import 'package:tasko/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = HomeController();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(
        child: Text('This is initial page'),
      ),
    );
  }
}
