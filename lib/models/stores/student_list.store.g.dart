// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentListStore on _StudentListStore, Store {
  late final _$studentsAtom =
      Atom(name: '_StudentListStore.students', context: context);

  @override
  ObservableList<StudentStore> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(ObservableList<StudentStore> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  late final _$initStudentsAsyncAction =
      AsyncAction('_StudentListStore.initStudents', context: context);

  @override
  Future<void> initStudents() {
    return _$initStudentsAsyncAction.run(() => super.initStudents());
  }

  late final _$_StudentListStoreActionController =
      ActionController(name: '_StudentListStore', context: context);

  @override
  void addStudent(StudentStore student) {
    final _$actionInfo = _$_StudentListStoreActionController.startAction(
        name: '_StudentListStore.addStudent');
    try {
      return super.addStudent(student);
    } finally {
      _$_StudentListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeStudent(StudentStore student) {
    final _$actionInfo = _$_StudentListStoreActionController.startAction(
        name: '_StudentListStore.removeStudent');
    try {
      return super.removeStudent(student);
    } finally {
      _$_StudentListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<StudentStore> findByTeacher(
      String idTeacher, ClassListStore classListStore) {
    final _$actionInfo = _$_StudentListStoreActionController.startAction(
        name: '_StudentListStore.findByTeacher');
    try {
      return super.findByTeacher(idTeacher, classListStore);
    } finally {
      _$_StudentListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  StudentStore findById(String id) {
    final _$actionInfo = _$_StudentListStoreActionController.startAction(
        name: '_StudentListStore.findById');
    try {
      return super.findById(id);
    } finally {
      _$_StudentListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
students: ${students}
    ''';
  }
}
