// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TeacherStoreList on _TeacherStoreList, Store {
  late final _$teachersAtom =
      Atom(name: '_TeacherStoreList.teachers', context: context);

  @override
  ObservableList<TeacherStore> get teachers {
    _$teachersAtom.reportRead();
    return super.teachers;
  }

  @override
  set teachers(ObservableList<TeacherStore> value) {
    _$teachersAtom.reportWrite(value, super.teachers, () {
      super.teachers = value;
    });
  }

  late final _$initTeachersAsyncAction =
      AsyncAction('_TeacherStoreList.initTeachers', context: context);

  @override
  Future<void> initTeachers() {
    return _$initTeachersAsyncAction.run(() => super.initTeachers());
  }

  late final _$addTeacherAsyncAction =
      AsyncAction('_TeacherStoreList.addTeacher', context: context);

  @override
  Future<void> addTeacher(String name, String email, String image_profile) {
    return _$addTeacherAsyncAction
        .run(() => super.addTeacher(name, email, image_profile));
  }

  late final _$updateTeacherAsyncAction =
      AsyncAction('_TeacherStoreList.updateTeacher', context: context);

  @override
  Future<void> updateTeacher(TeacherStore updatedTeacher) {
    return _$updateTeacherAsyncAction
        .run(() => super.updateTeacher(updatedTeacher));
  }

  late final _$_TeacherStoreListActionController =
      ActionController(name: '_TeacherStoreList', context: context);

  @override
  TeacherStore? findTeacherByEmail(String email) {
    final _$actionInfo = _$_TeacherStoreListActionController.startAction(
        name: '_TeacherStoreList.findTeacherByEmail');
    try {
      return super.findTeacherByEmail(email);
    } finally {
      _$_TeacherStoreListActionController.endAction(_$actionInfo);
    }
  }

  @override
  TeacherStore getByEmail(String email) {
    final _$actionInfo = _$_TeacherStoreListActionController.startAction(
        name: '_TeacherStoreList.getByEmail');
    try {
      return super.getByEmail(email);
    } finally {
      _$_TeacherStoreListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTeacher(String id) {
    final _$actionInfo = _$_TeacherStoreListActionController.startAction(
        name: '_TeacherStoreList.removeTeacher');
    try {
      return super.removeTeacher(id);
    } finally {
      _$_TeacherStoreListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
teachers: ${teachers}
    ''';
  }
}
