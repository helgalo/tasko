import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:tasko/services/firebase_errors_service.dart';
import 'package:tasko/services/snack_bar_service.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable
  bool isEmailValid = false;

  @observable
  String? errorMessage;

  @observable
  bool isLoading = false;

  @observable
  bool passwordVisible = false;

  @observable
  bool rememberMe = false;

  @observable
  User? user;

  _LoginStore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final email = GetStorage().read('email');
      if (email != null) {
        emailController.text = email;
        rememberMe = true;
      }
    });
  }

  @action
  void goToHome() {
    Modular.to.navigate('/register');
  }

  @action
  bool validateFields() {
    if (emailController.text.isEmpty) {
      errorMessage = 'Email is required';
      return false;
    } else if (passwordController.text.isEmpty) {
      errorMessage = 'Password is required';
      return false;
    } else if (!isValidEmail(emailController.text)) {
      errorMessage = 'Invalid email';
      return false;
    }
    errorMessage = null;
    return true;
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  @action
  Future<void> login() async {
    isLoading = true;
    try {
      bool result = validateFields();
      if (!result) {
        isLoading = false;
        return;
      }

      user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ))
          .user;

      if (user.runtimeType == User) {
        if (rememberMe) {
          GetStorage().write('email', emailController.text.trim());
        } else {
          GetStorage().remove('email');
        }
        Modular.to.navigate('/home');
      }
    } on FirebaseAuthException catch (e) {
      SnackBarService.getSnack(
        snackTitle: "Login Error",
        description: FirebaseErrorsService.getMessageFromErrorCode(e.code),
      );

      errorMessage = 'Invalid email or password';

      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  void changeIsEmailValid(bool value) {
    isEmailValid = value;
  }

  @action
  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
  }

  @action
  void toggleRememberMe(bool value) {
    rememberMe = value;
  }
}
