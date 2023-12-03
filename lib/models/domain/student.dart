import 'package:gereaulas_mobile/screens/responsible.dart';

class Student {
  String email;
  String name;
  String? contato;
  DateTime? dateBirth;
  Responsible? responsible;
  String address;

  Student(
      {this.email = "",
      this.name = "",
      this.dateBirth,
      this.responsible,
      this.address = "",
      this.contato});
  @override
  String toString() {
    String responsibleString =
        responsible != null ? responsible!.toString() : 'null';
    String dateBirthString = dateBirth != null ? dateBirth.toString() : 'null';

    return 'Student{'
        'email: $email, '
        'name: $name, '
        'contato: $contato, '
        'dateBirth: $dateBirthString, '
        'responsible: $responsibleString, '
        'address: $address}';
  }
}
