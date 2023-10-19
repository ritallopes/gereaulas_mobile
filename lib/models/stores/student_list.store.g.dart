// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentListStore on _StudentListStore, Store {
  late final _$allStudentAtom =
      Atom(name: '_StudentListStore.allStudent', context: context);

  @override
  ObservableList<Student> get allStudent {
    _$allStudentAtom.reportRead();
    return super.allStudent;
  }

  @override
  set allStudent(ObservableList<Student> value) {
    _$allStudentAtom.reportWrite(value, super.allStudent, () {
      super.allStudent = value;
    });
  }

  late final _$_StudentListStoreActionController =
      ActionController(name: '_StudentListStore', context: context);

  @override
  void addStudent(Student student) {
    final _$actionInfo = _$_StudentListStoreActionController.startAction(
        name: '_StudentListStore.addStudent');
    try {
      return super.addStudent(student);
    } finally {
      _$_StudentListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeStudent(Student student) {
    final _$actionInfo = _$_StudentListStoreActionController.startAction(
        name: '_StudentListStore.removeStudent');
    try {
      return super.removeStudent(student);
    } finally {
      _$_StudentListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Student> findByTeacher(
      String emailTeacher, ClassListStore classListStore) {
    final _$actionInfo = _$_StudentListStoreActionController.startAction(
        name: '_StudentListStore.findByTeacher');
    try {
      return super.findByTeacher(emailTeacher, classListStore);
    } finally {
      _$_StudentListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allStudent: ${allStudent}
    ''';
  }
}
