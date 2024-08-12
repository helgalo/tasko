// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskDetailsController on _TaskDetailsController, Store {
  late final _$actualTaskAtom =
      Atom(name: '_TaskDetailsController.actualTask', context: context);

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
      Atom(name: '_TaskDetailsController.isLoading', context: context);

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

  late final _$_TaskDetailsControllerActionController =
      ActionController(name: '_TaskDetailsController', context: context);

  @override
  void onTapBackButton() {
    final _$actionInfo = _$_TaskDetailsControllerActionController.startAction(
        name: '_TaskDetailsController.onTapBackButton');
    try {
      return super.onTapBackButton();
    } finally {
      _$_TaskDetailsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_TaskDetailsControllerActionController.startAction(
        name: '_TaskDetailsController.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_TaskDetailsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualTask: ${actualTask},
isLoading: ${isLoading}
    ''';
  }
}
