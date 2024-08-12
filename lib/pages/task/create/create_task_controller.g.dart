// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateTaskController on _CreateTaskController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CreateTaskController.isLoading', context: context);

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

  late final _$createTaskAsyncAction =
      AsyncAction('_CreateTaskController.createTask', context: context);

  @override
  Future<void> createTask() {
    return _$createTaskAsyncAction.run(() => super.createTask());
  }

  late final _$_CreateTaskControllerActionController =
      ActionController(name: '_CreateTaskController', context: context);

  @override
  Task getTask() {
    final _$actionInfo = _$_CreateTaskControllerActionController.startAction(
        name: '_CreateTaskController.getTask');
    try {
      return super.getTask();
    } finally {
      _$_CreateTaskControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_CreateTaskControllerActionController.startAction(
        name: '_CreateTaskController.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_CreateTaskControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
