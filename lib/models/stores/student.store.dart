import 'package:mobx/mobx.dart';
part 'student.store.g.dart';

class StudentStore = _StudentStore with _$StudentStore;

abstract class _StudentStore with Store {
  @observable
  String id = '';
  @observable
  String name = '';
  @observable
  String email = '';
  @observable
  String? contact = '';
  @observable
  DateTime? dateBirth;
  @observable
  String? idResponsible = '';
  @observable
  String address = '';

  @action
  void setId(String value) => id = value;
  @action
  void setName(String value) => name = value;
  @action
  void setEmail(String value) => email = value;
  @action
  void setContact(String value) => contact = value;
  @action
  void setDateBirth(String value) => dateBirth = DateTime.parse(value);
  @action
  void setIdResponsible(String value) => idResponsible = value;
  @action
  void setAddress(String value) => address = value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentStore && other.id == id && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'Student{'
        'email: $email, '
        'name: $name, '
        'contato: $contact, '
        'dateBirth: $dateBirth, '
        'responsible: $idResponsible, '
        'address: $address}';
  }
}
