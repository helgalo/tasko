import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasko/app_module.dart';
import 'package:tasko/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tasko/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
