import 'package:collection/collection.dart';
import 'package:gereaulas_mobile/data/dummy.dart';
import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/domain/student.dart';
import 'package:gereaulas_mobile/models/domain/teacher.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:mobx/mobx.dart';
part 'class_list.store.g.dart';

class ClassListStore = _ClassListStore with _$ClassListStore;

abstract class _ClassListStore with Store {
  @observable
  ObservableList<ClassStore> allClass = ObservableList.of(DUMMY_CLASS);

  @action
  void addClass(ClassStore c) {
    allClass.add(c);
  }

  @action
  void createClassFormData(Map<String, Object> formData) {
    ClassStore newClass = ClassStore(
        time: formData['time'] as ReservedTime,
        student: formData['student'] as Student,
        teacher: formData['teacher'] as Teacher,
        status: 'notStarted',
        residential: formData['residential'] as bool,
        paymentAmount: double.parse(formData['paymentAmount'].toString()),
        subject: formData['subject'].toString());
    allClass.add(newClass);
  }

  @action
  void removeClass(ClassStore c) {
    allClass.remove(c);
  }

  @action
  void changeStatus(ClassStore item, String newStatus) {
    item.status = newStatus;
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
  void cloneClass(ClassStore classSource, ReservedTime time, String subject) {
    ClassStore newClass = ClassStore(
        time: time,
        student: classSource.student,
        teacher: classSource.teacher,
        status: classSource.status,
        residential: classSource.residential,
        paymentAmount: classSource.paymentAmount,
        subject: subject);
    allClass.add(newClass);
  }

  @action
  List<ClassStore> findByTeacher(String email) {
    return allClass.where((c) {
      String teacherEmail = c.teacher.email;
      return teacherEmail.contains(email);
    }).toList();
  }
}
