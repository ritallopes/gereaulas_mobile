import 'package:gereaulas_mobile/models/responsible.dart';

class Student {
  String email;
  String name;
  DateTime? dateBirth;
  Responsible? responsible;
  String address;

  Student(
      {this.email = "",
      this.name = "",
      this.dateBirth,
      this.responsible,
      this.address = ""});
}
