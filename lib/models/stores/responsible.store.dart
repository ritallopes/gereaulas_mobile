import 'package:gereaulas_mobile/controllers/responsible_controller.dart';
import 'package:mobx/mobx.dart';
part 'responsible.store.g.dart';

class ResponsibleStore = _ResponsibleStore with _$ResponsibleStore;

abstract class _ResponsibleStore with Store {
  @observable
  String id = '';
  @observable
  String name = '';
  @observable
  String email = '';
  @observable
  String? contact = '';
  @action
  void setId(String value) => id = value;
  @action
  void setName(String value) => name = value;
  @action
  void setEmail(String value) => email = value;
  @action
  void setContact(String value) => contact = value;
  @action
  void copy(ResponsibleStore other) {
    id = other.id;
    name = other.name;
    email = other.email;
    contact = other.contact;
  }

  @override
  String toString() {
    return 'Responsible{name: $name, email: $email, Contact: ${contact ?? ''}}';
  }
}
