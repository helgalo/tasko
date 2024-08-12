import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tasko/services/snack_bar_service.dart';
import 'package:tasko/widgets/snack_bar_widget.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  bool passwordVisible = false;

  @observable
  User? user;

  @action
  void goToLogin() {
    Modular.to.navigate('/');
  }

  @action
  Future<void> login() async {
    isLoading = true;
    UserCredential userCredential;
    try {
      userCredential = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ));

      if (userCredential.runtimeType == UserCredential) {
        SnackBarService.getSnack(
          snackTitle: "Register",
          description: "User created successfully",
          type: SnackBarTypes.valid,
        );
        Modular.to.navigate('/');
      }
    } on FirebaseException catch (e) {
      SnackBarService.getSnack(
        snackTitle: "Register Error",
        description: e.code,
      );

      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
