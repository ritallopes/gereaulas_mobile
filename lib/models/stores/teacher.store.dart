import 'package:mobx/mobx.dart';
part 'teacher.store.g.dart';

class TeacherStore = _TeacherStore with _$TeacherStore;

abstract class _TeacherStore with Store {
  @observable
  String id = '';
  @observable
  String name = '';
  @observable
  String email = '';
  @observable
  String image_profile = '';
  @action
  void setId(String value) => id = value;
  @action
  void setName(String value) => name = value;
  @action
  void setEmail(String value) => email = value;
  @action
  void setImageProfile(String value) => image_profile = value;

  @override
  String toString() {
    return 'Teacher{name: $name, email: $email, imageProfile: $image_profile}';
  }

  @action
  void copy(TeacherStore other) {
    id = other.id;
    name = other.name;
    email = other.email;
    image_profile = other.image_profile;
  }
}
