import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tasko/models/task.dart';
import 'package:tasko/services/snack_bar_service.dart';
import 'package:tasko/widgets/snack_bar_widget.dart';
part 'create_task_store.g.dart';

class CreateTaskStore = _CreateTaskStore with _$CreateTaskStore;

abstract class _CreateTaskStore with Store {
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
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        CollectionReference tasks = FirebaseFirestore.instance
            .collection('task')
            .doc(user.uid)
            .collection("tasks");

        Task task = getTask();

        DocumentReference result = await tasks.add(task.toJson());

        if (result.id.isNotEmpty) {
          SnackBarService.getSnack(
            snackTitle: "Create Task",
            description: "Task created successfully",
            type: SnackBarTypes.valid,
          );
          Modular.to.navigate('/home');
        }
      }
    } on FirebaseException catch (e) {
      SnackBarService.getSnack(
        snackTitle: "Create Task Error",
        description: e.code,
      );

      debugPrint("Error creating task: $e");
    } finally {
      isLoading = false;
    }
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
