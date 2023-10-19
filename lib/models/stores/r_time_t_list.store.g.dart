// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'r_time_t_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RTimeRListStore on _RTimeRListStore, Store {
  late final _$reservedTimeListAtom =
      Atom(name: '_RTimeRListStore.reservedTimeList', context: context);

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

  late final _$_RTimeRListStoreActionController =
      ActionController(name: '_RTimeRListStore', context: context);

  @override
  dynamic addInitialReservedTime(dynamic Class) {
    final _$actionInfo = _$_RTimeRListStoreActionController.startAction(
        name: '_RTimeRListStore.addInitialReservedTime');
    try {
      return super.addInitialReservedTime(Class);
    } finally {
      _$_RTimeRListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableList<ReservedTimeTeacherStore> findByTeacher(String emailTeacher) {
    final _$actionInfo = _$_RTimeRListStoreActionController.startAction(
        name: '_RTimeRListStore.findByTeacher');
    try {
      return super.findByTeacher(emailTeacher);
    } finally {
      _$_RTimeRListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addReservedTimeTeacher(
      ReservedTime reservedTime, Teacher teacher, bool isOccupied) {
    final _$actionInfo = _$_RTimeRListStoreActionController.startAction(
        name: '_RTimeRListStore.addReservedTimeTeacher');
    try {
      return super.addReservedTimeTeacher(reservedTime, teacher, isOccupied);
    } finally {
      _$_RTimeRListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeReservedTimeTeacher(ReservedTimeTeacherStore reservedTimeTeacher) {
    final _$actionInfo = _$_RTimeRListStoreActionController.startAction(
        name: '_RTimeRListStore.removeReservedTimeTeacher');
    try {
      return super.removeReservedTimeTeacher(reservedTimeTeacher);
    } finally {
      _$_RTimeRListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reservedTimeList: ${reservedTimeList}
    ''';
  }
}
