import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tasko/models/task.dart';
part 'task_details_controller.g.dart';

class TaskDetailsController = _TaskDetailsController
    with _$TaskDetailsController;

abstract class _TaskDetailsController with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  Task? actualTask;

  @observable
  bool isLoading = false;

  _TaskDetailsController() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      actualTask = Modular.args.data as Task?;
    });
  }

  @action
  void onTapBackButton() {
    Modular.to.navigate('/home');
  }

  @action
  void changeIsLoading(bool value) {
    isLoading = value;
  }
}
