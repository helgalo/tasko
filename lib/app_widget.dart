import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tasko',
      routerConfig: Modular.routerConfig,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
    );
  }
}
