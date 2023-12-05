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
    return 'Teacher{name: $name, email: $email, image_profile: $image_profile}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeacherStore && other.id == id && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;

  @action
  void copy(TeacherStore other) {
    id = other.id;
    name = other.name;
    email = other.email;
    image_profile = other.image_profile;
  }
}
