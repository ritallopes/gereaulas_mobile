import 'package:gereaulas_mobile/controllers/teacher_controller.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:mobx/mobx.dart';
part 'teacher_list.store.g.dart';

class TeacherStoreList = _TeacherStoreList with _$TeacherStoreList;

abstract class _TeacherStoreList with Store {
  @observable
  ObservableList<TeacherStore> teachers = ObservableList<TeacherStore>();

  _TeacherStoreList() {
    initTeachers();
  }

  @action
  Future<void> initTeachers() async {
    List<TeacherStore> teacherList = await TeacherController.findAll();
    teachers.clear();
    teachers.addAll(teacherList);
  }

  @action
  Future<void> addTeacher(
      String name, String email, String image_profile) async {
    TeacherStore? t =
        await TeacherController.createTeacher(name, email, image_profile);
    if (t != null && t.id != '') {
      teachers.add(t);
    }
  }

  @action
  TeacherStore? findTeacherByEmail(String email) {
    return teachers.firstWhere((teacher) => teacher.email == email,
        orElse: () => TeacherStore());
  }

  @action
  Future<void> updateTeacher(TeacherStore updatedTeacher) async {
    final index =
        teachers.indexWhere((teacher) => teacher.email == updatedTeacher.email);
    if (index != -1) {
      TeacherStore? teacher =
          await TeacherController.updateTeacher(updatedTeacher);
      if (teacher != null && teacher.id == updatedTeacher.id) {
        teachers[index] = teacher;
      }
    }
  }

  @action
  TeacherStore getByEmail(String email) {
    TeacherStore teacher = teachers.firstWhere(
        (teacher) => teacher.email == email,
        orElse: () => TeacherStore());

    return teacher;
  }

  @action
  void removeTeacher(String id) {
    TeacherController.deleteTeacher(id);
    teachers.removeWhere((teacher) => teacher.id == id);
  }
}
