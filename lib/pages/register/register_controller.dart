import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  @action
  void goToLogin() {
    Modular.to.navigate('/');
  }
}
