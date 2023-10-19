// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClassStore on _ClassStore, Store {
  Computed<ReservedTime>? _$classTimeComputed;

  @override
  ReservedTime get classTime =>
      (_$classTimeComputed ??= Computed<ReservedTime>(() => super.classTime,
              name: '_ClassStore.classTime'))
          .value;
  Computed<Student>? _$classStudentComputed;

  @override
  Student get classStudent =>
      (_$classStudentComputed ??= Computed<Student>(() => super.classStudent,
              name: '_ClassStore.classStudent'))
          .value;
  Computed<Teacher>? _$classTeacherComputed;

  @override
  Teacher get classTeacher =>
      (_$classTeacherComputed ??= Computed<Teacher>(() => super.classTeacher,
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

  late final _$timeAtom = Atom(name: '_ClassStore.time', context: context);

  @override
  ReservedTime get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(ReservedTime value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$studentAtom =
      Atom(name: '_ClassStore.student', context: context);

  @override
  Student get student {
    _$studentAtom.reportRead();
    return super.student;
  }

  @override
  set student(Student value) {
    _$studentAtom.reportWrite(value, super.student, () {
      super.student = value;
    });
  }

  late final _$teacherAtom =
      Atom(name: '_ClassStore.teacher', context: context);

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

  late final _$residentialAtom =
      Atom(name: '_ClassStore.residential', context: context);

  @override
  bool get residential {
    _$residentialAtom.reportRead();
    return super.residential;
  }

  @override
  set residential(bool value) {
    _$residentialAtom.reportWrite(value, super.residential, () {
      super.residential = value;
    });
  }

  late final _$paymentAmountAtom =
      Atom(name: '_ClassStore.paymentAmount', context: context);

  @override
  double get paymentAmount {
    _$paymentAmountAtom.reportRead();
    return super.paymentAmount;
  }

  @override
  set paymentAmount(double value) {
    _$paymentAmountAtom.reportWrite(value, super.paymentAmount, () {
      super.paymentAmount = value;
    });
  }

  late final _$subjectAtom =
      Atom(name: '_ClassStore.subject', context: context);

  @override
  String get subject {
    _$subjectAtom.reportRead();
    return super.subject;
  }

  @override
  set subject(String value) {
    _$subjectAtom.reportWrite(value, super.subject, () {
      super.subject = value;
    });
  }

  late final _$statusAtom = Atom(name: '_ClassStore.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$_ClassStoreActionController =
      ActionController(name: '_ClassStore', context: context);

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
time: ${time},
student: ${student},
teacher: ${teacher},
residential: ${residential},
paymentAmount: ${paymentAmount},
subject: ${subject},
status: ${status},
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
