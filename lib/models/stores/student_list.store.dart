import 'package:gereaulas_mobile/data/dummy.dart';

import 'package:gereaulas_mobile/models/domain/student.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';

import 'package:mobx/mobx.dart';
part 'student_list.store.g.dart';

class StudentListStore = _StudentListStore with _$StudentListStore;

abstract class _StudentListStore with Store {
  @observable
  ObservableList<Student> allStudent = ObservableList.of(DUMMY_STUDENT);

  @action
  void addStudent(Student student) {
    allStudent.add(student);
  }

  @action
  void removeStudent(Student student) {
    allStudent.remove(student);
  }

  @action
  List<Student> findByTeacher(
      String emailTeacher, ClassListStore classListStore) {
    List<ClassStore> classTeacher =
        classListStore.findByTeacher(emailTeacher).where((c) {
      return c.teacher.email.contains(emailTeacher);
    }).toList();

    return classTeacher.map((e) => e.student).toSet().toList();
  }
}
