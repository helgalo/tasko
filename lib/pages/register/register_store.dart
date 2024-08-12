import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
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
        Modular.to.navigate('/');
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
