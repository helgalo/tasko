// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStore, Store {
  late final _$emailTextControllerAtom =
      Atom(name: '_RegisterStore.emailTextController', context: context);

  @override
  TextEditingController get emailTextController {
    _$emailTextControllerAtom.reportRead();
    return super.emailTextController;
  }

  @override
  set emailTextController(TextEditingController value) {
    _$emailTextControllerAtom.reportWrite(value, super.emailTextController, () {
      super.emailTextController = value;
    });
  }

  late final _$passwordTextControllerAtom =
      Atom(name: '_RegisterStore.passwordTextController', context: context);

  @override
  TextEditingController get passwordTextController {
    _$passwordTextControllerAtom.reportRead();
    return super.passwordTextController;
  }

  @override
  set passwordTextController(TextEditingController value) {
    _$passwordTextControllerAtom
        .reportWrite(value, super.passwordTextController, () {
      super.passwordTextController = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_RegisterStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$passwordVisibleAtom =
      Atom(name: '_RegisterStore.passwordVisible', context: context);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  late final _$userAtom = Atom(name: '_RegisterStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_RegisterStore.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore', context: context);

  @override
  void goToLogin() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.goToLogin');
    try {
      return super.goToLogin();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailTextController: ${emailTextController},
passwordTextController: ${passwordTextController},
isLoading: ${isLoading},
passwordVisible: ${passwordVisible},
user: ${user}
    ''';
  }
}
