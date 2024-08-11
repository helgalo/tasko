import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tasko/firebase_options.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
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
  void goToHome() {
    Modular.to.navigate('/register');
  }

  @action
  Future<void> login() async {
    isLoading = true;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ))
          .user;

      isLoading = false;
      Modular.to.navigate('/home');
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
  }
}
