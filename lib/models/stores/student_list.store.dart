import 'package:gereaulas_mobile/controllers/student_controller.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/student.store.dart';

import 'package:mobx/mobx.dart';
part 'student_list.store.g.dart';

class StudentListStore = _StudentListStore with _$StudentListStore;

abstract class _StudentListStore with Store {
  @observable
  ObservableList<StudentStore> students = ObservableList<StudentStore>();
  _StudentStoreList() {
    initStudents();
  }

  @action
  Future<void> initStudents() async {
    List<StudentStore> studentsList = await StudentController.findAllLocal();
    students.clear();
    students.addAll(studentsList);
  }

  @action
  void addStudent(StudentStore student) {
    students.add(student);
  }

  @action
  void removeStudent(StudentStore student) {
    students.remove(student);
  }

  @action
  List<StudentStore> findByTeacher(
      String idTeacher, ClassListStore classListStore) {
    List<ClassStore> classTeacher =
        classListStore.findByTeacher(idTeacher).where((c) {
      return c.teacher.contains(idTeacher);
    }).toList();

    List<String> idStudents =
        classTeacher.map((e) => e.student).toSet().toList();

    //List<StudentStore> studentsTeacher =
    students.where((e) => idStudents.contains(e.id)).toList();
    //return studentsTeacher;
    return students;
  }

  @action
  StudentStore findById(String id) {
    StudentStore student = students.where((e) => e.id == id).first;

    return student;
  }
}
