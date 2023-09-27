import 'package:gereaulas_mobile/models/class_schedule.dart';
import 'package:gereaulas_mobile/models/reserved_time.dart';
import 'package:gereaulas_mobile/models/responsible.dart';
import 'package:gereaulas_mobile/models/student.dart';
import 'package:gereaulas_mobile/models/teacher.dart';
import 'package:gereaulas_mobile/models/user.dart';

var DUMMY_USERS = [
  User(
    email: 'ritalino@gmail.com',
    password: '12345',
    type: 'teacher',
  )
];

var DUMMY_TEACHERS = [
  Teacher(
      name: 'Ana',
      email: 'ritalino@gmail.com',
      image_profile: "assets/imgs/example_profile.svg"),
];

var DUMMY_RESPONSIBLE = [Responsible(email: 'maria@gmail.com', name: "Maria")];

var DUMMY_STUDENT = [
  Student(
      email: 'lala@gmail.com',
      address: 'Av. Mor Gouveia',
      dateBirth: DateTime.parse('2007-07-20 20:18:04Z'),
      name: "Clara",
      responsible: DUMMY_RESPONSIBLE[0]),
  Student(
      email: 'marcelo@gmail.com',
      address: 'Av. Mor Gouveia',
      dateBirth: DateTime.parse('2007-07-20 20:18:04Z'),
      name: "Marcela",
      responsible: DUMMY_RESPONSIBLE[0])
];

var DUMMY_RESERVEDTIME = [
  ReservedTime(
      start: DateTime.parse('2023-09-27 11:00:04Z'),
      end: DateTime.parse('2023-09-27 12:00:04Z'))
];
var DUMMY_CLASS = [
  ClassSchedule(
      residential: true,
      paymentAmount: 60.0,
      student: DUMMY_STUDENT[0],
      subject: 'Geografia',
      teacher: DUMMY_TEACHERS[0],
      time: DUMMY_RESERVEDTIME[0],
      finished: false),
  ClassSchedule(
      residential: true,
      paymentAmount: 60.0,
      student: DUMMY_STUDENT[1],
      subject: 'Matemática',
      teacher: DUMMY_TEACHERS[0],
      time: DUMMY_RESERVEDTIME[0],
      finished: false)
];
