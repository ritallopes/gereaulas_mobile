// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClassStore on _ClassStore, Store {
  Computed<ReservedTimeTeacherStore>? _$classTimeComputed;

  @override
  ReservedTimeTeacherStore get classTime => (_$classTimeComputed ??=
          Computed<ReservedTimeTeacherStore>(() => super.classTime,
              name: '_ClassStore.classTime'))
      .value;
  Computed<String>? _$classStudentComputed;

  @override
  String get classStudent =>
      (_$classStudentComputed ??= Computed<String>(() => super.classStudent,
              name: '_ClassStore.classStudent'))
          .value;
  Computed<String>? _$classTeacherComputed;

  @override
  String get classTeacher =>
      (_$classTeacherComputed ??= Computed<String>(() => super.classTeacher,
              name: '_ClassStore.classTeacher'))
          .value;
  Computed<bool>? _$isResidentialComputed;

  @override
  bool get isResidential =>
      (_$isResidentialComputed ??= Computed<bool>(() => super.isResidential,
              name: '_ClassStore.isResidential'))
          .value;
  Computed<double>? _$classPaymentAmountComputed;

  @override
  double get classPaymentAmount => (_$classPaymentAmountComputed ??=
          Computed<double>(() => super.classPaymentAmount,
              name: '_ClassStore.classPaymentAmount'))
      .value;
  Computed<String>? _$classSubjectComputed;

  @override
  String get classSubject =>
      (_$classSubjectComputed ??= Computed<String>(() => super.classSubject,
              name: '_ClassStore.classSubject'))
          .value;
  Computed<String>? _$classStatusComputed;

  @override
  String get classStatus =>
      (_$classStatusComputed ??= Computed<String>(() => super.classStatus,
              name: '_ClassStore.classStatus'))
          .value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_ClassStore.isValid'))
      .value;

  late final _$_timeAtom = Atom(name: '_ClassStore._time', context: context);

  @override
  ReservedTimeTeacherStore get _time {
    _$_timeAtom.reportRead();
    return super._time;
  }

  @override
  set _time(ReservedTimeTeacherStore value) {
    _$_timeAtom.reportWrite(value, super._time, () {
      super._time = value;
    });
  }

  late final _$_studentAtom =
      Atom(name: '_ClassStore._student', context: context);

  @override
  String get _student {
    _$_studentAtom.reportRead();
    return super._student;
  }

  @override
  set _student(String value) {
    _$_studentAtom.reportWrite(value, super._student, () {
      super._student = value;
    });
  }

  late final _$_teacherAtom =
      Atom(name: '_ClassStore._teacher', context: context);

  @override
  String get _teacher {
    _$_teacherAtom.reportRead();
    return super._teacher;
  }

  @override
  set _teacher(String value) {
    _$_teacherAtom.reportWrite(value, super._teacher, () {
      super._teacher = value;
    });
  }

  late final _$_residentialAtom =
      Atom(name: '_ClassStore._residential', context: context);

  @override
  bool get _residential {
    _$_residentialAtom.reportRead();
    return super._residential;
  }

  @override
  set _residential(bool value) {
    _$_residentialAtom.reportWrite(value, super._residential, () {
      super._residential = value;
    });
  }

  late final _$_paymentAmountAtom =
      Atom(name: '_ClassStore._paymentAmount', context: context);

  @override
  double get _paymentAmount {
    _$_paymentAmountAtom.reportRead();
    return super._paymentAmount;
  }

  @override
  set _paymentAmount(double value) {
    _$_paymentAmountAtom.reportWrite(value, super._paymentAmount, () {
      super._paymentAmount = value;
    });
  }

  late final _$_idAtom = Atom(name: '_ClassStore._id', context: context);

  @override
  String get _id {
    _$_idAtom.reportRead();
    return super._id;
  }

  @override
  set _id(String value) {
    _$_idAtom.reportWrite(value, super._id, () {
      super._id = value;
    });
  }

  late final _$_subjectAtom =
      Atom(name: '_ClassStore._subject', context: context);

  @override
  String get _subject {
    _$_subjectAtom.reportRead();
    return super._subject;
  }

  @override
  set _subject(String value) {
    _$_subjectAtom.reportWrite(value, super._subject, () {
      super._subject = value;
    });
  }

  late final _$_statusAtom =
      Atom(name: '_ClassStore._status', context: context);

  @override
  String get _status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  set _status(String value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_ClassStoreActionController =
      ActionController(name: '_ClassStore', context: context);

  @override
  void setTime(ReservedTimeTeacherStore value) {
    final _$actionInfo =
        _$_ClassStoreActionController.startAction(name: '_ClassStore.setTime');
    try {
      return super.setTime(value);
    } finally {
      _$_ClassStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStudent(String value) {
    final _$actionInfo = _$_ClassStoreActionController.startAction(
        name: '_ClassStore.setStudent');
    try {
      return super.setStudent(value);
    } finally {
      _$_ClassStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTeacher(String value) {
    final _$actionInfo = _$_ClassStoreActionController.startAction(
        name: '_ClassStore.setTeacher');
    try {
      return super.setTeacher(value);
    } finally {
      _$_ClassStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResidential(bool value) {
    final _$actionInfo = _$_ClassStoreActionController.startAction(
        name: '_ClassStore.setResidential');
    try {
      return super.setResidential(value);
    } finally {
      _$_ClassStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaymentAmount(double value) {
    final _$actionInfo = _$_ClassStoreActionController.startAction(
        name: '_ClassStore.setPaymentAmount');
    try {
      return super.setPaymentAmount(value);
    } finally {
      _$_ClassStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setId(String value) {
    final _$actionInfo =
        _$_ClassStoreActionController.startAction(name: '_ClassStore.setId');
    try {
      return super.setId(value);
    } finally {
      _$_ClassStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSubject(String value) {
    final _$actionInfo = _$_ClassStoreActionController.startAction(
        name: '_ClassStore.setSubject');
    try {
      return super.setSubject(value);
    } finally {
      _$_ClassStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(String value) {
    final _$actionInfo = _$_ClassStoreActionController.startAction(
        name: '_ClassStore.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_ClassStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStatus(String newStatus) {
    final _$actionInfo = _$_ClassStoreActionController.startAction(
        name: '_ClassStore.changeStatus');
    try {
      return super.changeStatus(newStatus);
    } finally {
      _$_ClassStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
classTime: ${classTime},
classStudent: ${classStudent},
classTeacher: ${classTeacher},
isResidential: ${isResidential},
classPaymentAmount: ${classPaymentAmount},
classSubject: ${classSubject},
classStatus: ${classStatus},
isValid: ${isValid}
    ''';
  }
}
