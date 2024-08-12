import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tasko/models/task.dart';
part 'create_task_controller.g.dart';

class CreateTaskController = _CreateTaskController with _$CreateTaskController;

abstract class _CreateTaskController with Store {
  @observable
  bool isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void onTapBackButton() {
    Modular.to.navigate('/home');
  }

  @action
  Future<void> createTask() async {
    isLoading = true;
    User? user = _auth.currentUser;
    if (user != null) {
      CollectionReference tasks = FirebaseFirestore.instance
          .collection('task')
          .doc(user.uid)
          .collection("tasks");

      Task task = getTask();

      await tasks.add(task.toJson());
    }
    isLoading = false;
  }

  @action
  Task getTask() {
    return Task(
      title: titleController.text,
      description: descriptionController.text,
    );
  }

  @action
  void changeIsLoading(bool value) {
    isLoading = value;
  }
}
