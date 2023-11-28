import 'package:collection/collection.dart';
import 'package:gereaulas_mobile/controllers/class_controller.dart';
import 'package:gereaulas_mobile/controllers/reserved_controller.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:gereaulas_mobile/models/stores/reserved_time_teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/student.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/utils/utils_functions.dart';
import 'package:mobx/mobx.dart';
part 'class_list.store.g.dart';

class ClassListStore = _ClassListStore with _$ClassListStore;

abstract class _ClassListStore with Store {
  @observable
  ObservableList<ClassStore> allClass = ObservableList<ClassStore>();

  _ClassListStore() {
    initClasses();
  }
  @action
  Future<void> initClasses() async {
    List<ClassStore> classList = await ClassController.findAllLocal();
    allClass.clear();
    allClass.addAll(classList);
  }

  @action
  void addClass(ClassStore c) {
    allClass.add(c);
  }

  @action
  void addClassFromFields({
    required ReservedTimeTeacherStore time,
    required StudentStore student,
    required TeacherStore teacher,
    String status = 'notStarted',
    required bool residential,
    required double paymentAmount,
    required String subject,
  }) {
    ClassStore newClass = ClassStore()
      ..setTime(time)
      ..setStudent(student.id)
      ..setTeacher(teacher.id)
      ..setStatus(status)
      ..setResidential(residential)
      ..setPaymentAmount(paymentAmount)
      ..setSubject(subject);
    ReservedController.saveReservedTimeTeacher(reservedTimeTeacherStore: time)
        .then((value) {
      newClass.classTime.id = value?.id ?? '';
      ClassController.createClass(newClass);
      allClass.add(newClass);
    });
  }

  @action
  void createClassFormData(Map<String, Object> formData) {
    ClassStore newClass = ClassStore();
    newClass.setTime(formData['time'] as ReservedTimeTeacherStore);
    newClass.setStudent(formData['student'].toString());
    newClass.setTeacher((formData['teacher'] as TeacherStore).id);
    newClass.setStatus('notStarted');
    newClass.setResidential(formData['residential'] as bool);
    newClass
        .setPaymentAmount(double.parse(formData['paymentAmount'].toString()));
    newClass.setSubject(formData['subject'].toString());
    ClassController.createClass(newClass);
    allClass.add(newClass);
  }

  @action
  void removeClass(ClassStore c) {
    allClass.remove(c);
  }

  @action
  void changeStatus(ClassStore item, String newStatus) {
    item.setStatus(newStatus);
    allClass.forEachIndexed((index, element) {
      if (element.teacher == item.teacher &&
          element.student == item.student &&
          item.time.start == element.time.start) {
        allClass[index] = item;
        return;
      }
    });
  }

  @action
  void cloneClass(
      ClassStore classSource, ReservedTimeTeacherStore time, String subject) {
    ClassStore newClass = ClassStore();

    allClass.add(newClass);
  }

  @action
  List<ClassStore> findByTeacher(String id) {
    List<ClassStore> classes = [];
    classes.addAll(allClass.where((c) {
      return c.teacher.contains(id);
    }).toList());
    return classes;
  }

  @action
  List<String> getSubjectsForTeacherOnCurrentDay(String id) {
    DateTime currentDate = DateTime.now();

    List<ClassStore> classesForTeacherOnCurrentDay = allClass.where((c) {
      return c.teacher == id &&
          differenceBetweenDate(c.time.start, currentDate) == 0;
    }).toList();

    return classesForTeacherOnCurrentDay.map((c) => c.subject).toList();
  }

  @computed
  List<ClassStore> get getClassTeacherToday {
    DateTime currentDate = DateTime.now();
    return allClass
        .where((c) => differenceBetweenDate(c.time.start, currentDate) == 0)
        .toList();
  }

  @computed
  List<ClassStore> get getClassTeacherTodayFinished {
    DateTime currentDate = DateTime.now();
    return allClass
        .where((c) =>
            differenceBetweenDate(c.time.start, currentDate) == 0 &&
            c.status == 'finished')
        .toList();
  }
}
