// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserved_time_teacher.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReservedTimeTeacherStore on _ReservedTimeTeacherStore, Store {
  late final _$startAtom =
      Atom(name: '_ReservedTimeTeacherStore.start', context: context);

  @override
  DateTime get start {
    _$startAtom.reportRead();
    return super.start;
  }

  @override
  set start(DateTime value) {
    _$startAtom.reportWrite(value, super.start, () {
      super.start = value;
    });
  }

  late final _$endTimeAtom =
      Atom(name: '_ReservedTimeTeacherStore.endTime', context: context);

  @override
  DateTime get endTime {
    _$endTimeAtom.reportRead();
    return super.endTime;
  }

  @override
  set endTime(DateTime value) {
    _$endTimeAtom.reportWrite(value, super.endTime, () {
      super.endTime = value;
    });
  }

  late final _$idAtom =
      Atom(name: '_ReservedTimeTeacherStore.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$teacherAtom =
      Atom(name: '_ReservedTimeTeacherStore.teacher', context: context);

  @override
  TeacherStore? get teacher {
    _$teacherAtom.reportRead();
    return super.teacher;
  }

  @override
  set teacher(TeacherStore? value) {
    _$teacherAtom.reportWrite(value, super.teacher, () {
      super.teacher = value;
    });
  }

  late final _$isOccupiedAtom =
      Atom(name: '_ReservedTimeTeacherStore.isOccupied', context: context);

  @override
  bool get isOccupied {
    _$isOccupiedAtom.reportRead();
    return super.isOccupied;
  }

  @override
  set isOccupied(bool value) {
    _$isOccupiedAtom.reportWrite(value, super.isOccupied, () {
      super.isOccupied = value;
    });
  }

  late final _$_ReservedTimeTeacherStoreActionController =
      ActionController(name: '_ReservedTimeTeacherStore', context: context);

  @override
  void setFieldsFromJson(Map<String, dynamic> json) {
    final _$actionInfo = _$_ReservedTimeTeacherStoreActionController
        .startAction(name: '_ReservedTimeTeacherStore.setFieldsFromJson');
    try {
      return super.setFieldsFromJson(json);
    } finally {
      _$_ReservedTimeTeacherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markAsOccupied() {
    final _$actionInfo = _$_ReservedTimeTeacherStoreActionController
        .startAction(name: '_ReservedTimeTeacherStore.markAsOccupied');
    try {
      return super.markAsOccupied();
    } finally {
      _$_ReservedTimeTeacherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markAsAvailable() {
    final _$actionInfo = _$_ReservedTimeTeacherStoreActionController
        .startAction(name: '_ReservedTimeTeacherStore.markAsAvailable');
    try {
      return super.markAsAvailable();
    } finally {
      _$_ReservedTimeTeacherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
start: ${start},
endTime: ${endTime},
id: ${id},
teacher: ${teacher},
isOccupied: ${isOccupied}
    ''';
  }
}
