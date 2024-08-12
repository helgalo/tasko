// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskDetailsStore on _TaskDetailsStore, Store {
  late final _$actualTaskAtom =
      Atom(name: '_TaskDetailsStore.actualTask', context: context);

  @override
  Task? get actualTask {
    _$actualTaskAtom.reportRead();
    return super.actualTask;
  }

  @override
  set actualTask(Task? value) {
    _$actualTaskAtom.reportWrite(value, super.actualTask, () {
      super.actualTask = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TaskDetailsStore.isLoading', context: context);

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

  late final _$hasChangesAtom =
      Atom(name: '_TaskDetailsStore.hasChanges', context: context);

  @override
  bool get hasChanges {
    _$hasChangesAtom.reportRead();
    return super.hasChanges;
  }

  @override
  set hasChanges(bool value) {
    _$hasChangesAtom.reportWrite(value, super.hasChanges, () {
      super.hasChanges = value;
    });
  }

  late final _$onChangeTaskAsyncAction =
      AsyncAction('_TaskDetailsStore.onChangeTask', context: context);

  @override
  Future<void> onChangeTask() {
    return _$onChangeTaskAsyncAction.run(() => super.onChangeTask());
  }

  late final _$updateTaskAsyncAction =
      AsyncAction('_TaskDetailsStore.updateTask', context: context);

  @override
  Future<void> updateTask() {
    return _$updateTaskAsyncAction.run(() => super.updateTask());
  }

  late final _$_TaskDetailsStoreActionController =
      ActionController(name: '_TaskDetailsStore', context: context);

  @override
  void onTapBackButton() {
    final _$actionInfo = _$_TaskDetailsStoreActionController.startAction(
        name: '_TaskDetailsStore.onTapBackButton');
    try {
      return super.onTapBackButton();
    } finally {
      _$_TaskDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_TaskDetailsStoreActionController.startAction(
        name: '_TaskDetailsStore.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_TaskDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualTask: ${actualTask},
isLoading: ${isLoading},
hasChanges: ${hasChanges}
    ''';
  }
}
