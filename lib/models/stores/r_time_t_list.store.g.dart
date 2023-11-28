// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'r_time_t_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimeListStore on _TimeListStore, Store {
  late final _$reservedTimeListAtom =
      Atom(name: '_TimeListStore.reservedTimeList', context: context);

  @override
  ObservableList<ReservedTimeTeacherStore> get reservedTimeList {
    _$reservedTimeListAtom.reportRead();
    return super.reservedTimeList;
  }

  @override
  set reservedTimeList(ObservableList<ReservedTimeTeacherStore> value) {
    _$reservedTimeListAtom.reportWrite(value, super.reservedTimeList, () {
      super.reservedTimeList = value;
    });
  }

  late final _$initTimesAsyncAction =
      AsyncAction('_TimeListStore.initTimes', context: context);

  @override
  Future<void> initTimes() {
    return _$initTimesAsyncAction.run(() => super.initTimes());
  }

  late final _$_TimeListStoreActionController =
      ActionController(name: '_TimeListStore', context: context);

  @override
  dynamic addInitialReservedTime(dynamic Class) {
    final _$actionInfo = _$_TimeListStoreActionController.startAction(
        name: '_TimeListStore.addInitialReservedTime');
    try {
      return super.addInitialReservedTime(Class);
    } finally {
      _$_TimeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableList<ReservedTimeTeacherStore> findByTeacher(String idTeacher) {
    final _$actionInfo = _$_TimeListStoreActionController.startAction(
        name: '_TimeListStore.findByTeacher');
    try {
      return super.findByTeacher(idTeacher);
    } finally {
      _$_TimeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addReservedTimeTeacher(
      DateTime start, DateTime endTime, TeacherStore teacher, bool isOccupied) {
    final _$actionInfo = _$_TimeListStoreActionController.startAction(
        name: '_TimeListStore.addReservedTimeTeacher');
    try {
      return super.addReservedTimeTeacher(start, endTime, teacher, isOccupied);
    } finally {
      _$_TimeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addReservedTimeStoreTeacher(ReservedTimeTeacherStore newTime) {
    final _$actionInfo = _$_TimeListStoreActionController.startAction(
        name: '_TimeListStore.addReservedTimeStoreTeacher');
    try {
      return super.addReservedTimeStoreTeacher(newTime);
    } finally {
      _$_TimeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeReservedTimeTeacher(ReservedTimeTeacherStore reservedTimeTeacher) {
    final _$actionInfo = _$_TimeListStoreActionController.startAction(
        name: '_TimeListStore.removeReservedTimeTeacher');
    try {
      return super.removeReservedTimeTeacher(reservedTimeTeacher);
    } finally {
      _$_TimeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableList<ReservedTimeTeacherStore> findByTeacherId(String idTeacher) {
    final _$actionInfo = _$_TimeListStoreActionController.startAction(
        name: '_TimeListStore.findByTeacherId');
    try {
      return super.findByTeacherId(idTeacher);
    } finally {
      _$_TimeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableList<ReservedTimeTeacherStore> findByTeacherEmail(String email) {
    final _$actionInfo = _$_TimeListStoreActionController.startAction(
        name: '_TimeListStore.findByTeacherEmail');
    try {
      return super.findByTeacherEmail(email);
    } finally {
      _$_TimeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reservedTimeList: ${reservedTimeList}
    ''';
  }
}
