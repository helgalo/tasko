// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateTaskStore on _CreateTaskStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CreateTaskStore.isLoading', context: context);

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
      AsyncAction('_CreateTaskStore.createTask', context: context);

  @override
  Future<void> createTask() {
    return _$createTaskAsyncAction.run(() => super.createTask());
  }

  late final _$_CreateTaskStoreActionController =
      ActionController(name: '_CreateTaskStore', context: context);

  @override
  Task getTask() {
    final _$actionInfo = _$_CreateTaskStoreActionController.startAction(
        name: '_CreateTaskStore.getTask');
    try {
      return super.getTask();
    } finally {
      _$_CreateTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_CreateTaskStoreActionController.startAction(
        name: '_CreateTaskStore.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_CreateTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
