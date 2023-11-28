// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClassListStore on _ClassListStore, Store {
  Computed<List<ClassStore>>? _$getClassTeacherTodayComputed;

  @override
  List<ClassStore> get getClassTeacherToday =>
      (_$getClassTeacherTodayComputed ??= Computed<List<ClassStore>>(
              () => super.getClassTeacherToday,
              name: '_ClassListStore.getClassTeacherToday'))
          .value;
  Computed<List<ClassStore>>? _$getClassTeacherTodayFinishedComputed;

  @override
  List<ClassStore> get getClassTeacherTodayFinished =>
      (_$getClassTeacherTodayFinishedComputed ??= Computed<List<ClassStore>>(
              () => super.getClassTeacherTodayFinished,
              name: '_ClassListStore.getClassTeacherTodayFinished'))
          .value;

  late final _$allClassAtom =
      Atom(name: '_ClassListStore.allClass', context: context);

  @override
  ObservableList<ClassStore> get allClass {
    _$allClassAtom.reportRead();
    return super.allClass;
  }

  @override
  set allClass(ObservableList<ClassStore> value) {
    _$allClassAtom.reportWrite(value, super.allClass, () {
      super.allClass = value;
    });
  }

  late final _$initClassesAsyncAction =
      AsyncAction('_ClassListStore.initClasses', context: context);

  @override
  Future<void> initClasses() {
    return _$initClassesAsyncAction.run(() => super.initClasses());
  }

  late final _$_ClassListStoreActionController =
      ActionController(name: '_ClassListStore', context: context);

  @override
  void addClass(ClassStore c) {
    final _$actionInfo = _$_ClassListStoreActionController.startAction(
        name: '_ClassListStore.addClass');
    try {
      return super.addClass(c);
    } finally {
      _$_ClassListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addClassFromFields(
      {required ReservedTimeTeacherStore time,
      required StudentStore student,
      required TeacherStore teacher,
      String status = 'notStarted',
      required bool residential,
      required double paymentAmount,
      required String subject}) {
    final _$actionInfo = _$_ClassListStoreActionController.startAction(
        name: '_ClassListStore.addClassFromFields');
    try {
      return super.addClassFromFields(
          time: time,
          student: student,
          teacher: teacher,
          status: status,
          residential: residential,
          paymentAmount: paymentAmount,
          subject: subject);
    } finally {
      _$_ClassListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createClassFormData(Map<String, Object> formData) {
    final _$actionInfo = _$_ClassListStoreActionController.startAction(
        name: '_ClassListStore.createClassFormData');
    try {
      return super.createClassFormData(formData);
    } finally {
      _$_ClassListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeClass(ClassStore c) {
    final _$actionInfo = _$_ClassListStoreActionController.startAction(
        name: '_ClassListStore.removeClass');
    try {
      return super.removeClass(c);
    } finally {
      _$_ClassListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStatus(ClassStore item, String newStatus) {
    final _$actionInfo = _$_ClassListStoreActionController.startAction(
        name: '_ClassListStore.changeStatus');
    try {
      return super.changeStatus(item, newStatus);
    } finally {
      _$_ClassListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cloneClass(
      ClassStore classSource, ReservedTimeTeacherStore time, String subject) {
    final _$actionInfo = _$_ClassListStoreActionController.startAction(
        name: '_ClassListStore.cloneClass');
    try {
      return super.cloneClass(classSource, time, subject);
    } finally {
      _$_ClassListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<ClassStore> findByTeacher(String id) {
    final _$actionInfo = _$_ClassListStoreActionController.startAction(
        name: '_ClassListStore.findByTeacher');
    try {
      return super.findByTeacher(id);
    } finally {
      _$_ClassListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> getSubjectsForTeacherOnCurrentDay(String id) {
    final _$actionInfo = _$_ClassListStoreActionController.startAction(
        name: '_ClassListStore.getSubjectsForTeacherOnCurrentDay');
    try {
      return super.getSubjectsForTeacherOnCurrentDay(id);
    } finally {
      _$_ClassListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allClass: ${allClass},
getClassTeacherToday: ${getClassTeacherToday},
getClassTeacherTodayFinished: ${getClassTeacherTodayFinished}
    ''';
  }
}
