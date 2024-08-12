import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tasko/models/task.dart';
part 'task_details_store.g.dart';

class TaskDetailsStore = _TaskDetailsStore with _$TaskDetailsStore;

abstract class _TaskDetailsStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @observable
  Task? actualTask;

  @observable
  bool isLoading = false;

  @observable
  bool hasChanges = false;

  _TaskDetailsStore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      actualTask = Modular.args.data as Task?;
      nameController.text = actualTask?.title ?? '';
      descriptionController.text = actualTask?.description ?? '';
    });
  }

  @action
  Future<void> onChangeTask() async {
    if (actualTask?.title == nameController.text &&
        actualTask?.description == descriptionController.text) {
      hasChanges = false;
      return;
    }
    hasChanges = true;
  }

  @action
  Future<void> updateTask() async {
    isLoading = true;

    actualTask = Task(
      id: actualTask?.id,
      title: nameController.text,
      description: descriptionController.text,
    );

    User? user = _auth.currentUser;
    if (user != null) {
      CollectionReference tasks = FirebaseFirestore.instance
          .collection('task')
          .doc(user.uid)
          .collection("tasks");

      await tasks.doc(actualTask?.id).update(actualTask!.toJson());
    }
    isLoading = false;
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
