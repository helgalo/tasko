import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tasko/models/task.dart';
import 'package:tasko/services/snack_bar_service.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  List<Task> tasks = [];

  @observable
  bool isLoading = false;

  User? get user => _auth.currentUser!;

  _HomeStore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTasks();
    });
  }

  @action
  Future<void> getTasks() async {
    isLoading = true;
    try {
      if (user != null) {
        CollectionReference tasksRef = FirebaseFirestore.instance
            .collection('task')
            .doc(user?.uid)
            .collection("tasks");

        QuerySnapshot snapshot = await tasksRef.get();
        tasks = snapshot.docs
            .map((e) => Task.fromJson(e.id, e.data() as Map<String, dynamic>))
            .toList()
            .cast<Task>();
      }
    } on FirebaseException catch (e) {
      SnackBarService.getSnack(
        snackTitle: "Tasks Error",
        description: e.code,
      );

      debugPrint("Error fetching tasks: $e");
    } finally {
      isLoading = false;
    }
  }

  @action
  void goToDetailsPage(Task task) {
    Modular.to.navigate('/task_details', arguments: task);
  }

  @action
  void onTapCreateTask() {
    Modular.to.navigate('/create_task');
  }

  @action
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
    Modular.to.navigate('/');
  }

  @action
  void changeIsLoading(bool value) {
    isLoading = value;
  }
}
