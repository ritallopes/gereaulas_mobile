// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserved_time_teacher.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReservedTimeTeacherStore on _ReservedTimeTeacherStore, Store {
  late final _$reservedTimeAtom =
      Atom(name: '_ReservedTimeTeacherStore.reservedTime', context: context);

  @override
  ReservedTime get reservedTime {
    _$reservedTimeAtom.reportRead();
    return super.reservedTime;
  }

  @override
  set reservedTime(ReservedTime value) {
    _$reservedTimeAtom.reportWrite(value, super.reservedTime, () {
      super.reservedTime = value;
    });
  }

  late final _$teacherAtom =
      Atom(name: '_ReservedTimeTeacherStore.teacher', context: context);

  @override
  Teacher get teacher {
    _$teacherAtom.reportRead();
    return super.teacher;
  }

  @override
  set teacher(Teacher value) {
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
reservedTime: ${reservedTime},
teacher: ${teacher},
isOccupied: ${isOccupied}
    ''';
  }
}
