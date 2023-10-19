import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/domain/responsible.dart';
import 'package:gereaulas_mobile/models/domain/student.dart';
import 'package:gereaulas_mobile/models/domain/teacher.dart';
import 'package:gereaulas_mobile/models/domain/user.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';

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
      image_profile: "assets/images/example_profile.svg"),
];

var DUMMY_RESPONSIBLE = [
  Responsible(
    email: 'maria@gmail.com',
    name: "Maria",
    contato: '(84) 9979191911',
  )
];

var DUMMY_STUDENT = [
  Student(
      email: 'lala@gmail.com',
      address: 'Av. Mor Gouveia',
      contato: '(84) 9979191911',
      dateBirth: DateTime.parse('2007-07-20 20:18:04Z'),
      name: "Clara",
      responsible: DUMMY_RESPONSIBLE[0]),
  Student(
      email: 'marcelo@gmail.com',
      address: 'Av. Mor Gouveia',
      contato: '(84) 999191911',
      dateBirth: DateTime.parse('2007-07-20 20:18:04Z'),
      name: "Marcela",
      responsible: DUMMY_RESPONSIBLE[0]),
  Student(
      email: 'dgsd@gmail.com',
      address: 'Av. Mor Gouveia',
      contato: '(84) 9979191911',
      dateBirth: DateTime.parse('2007-07-20 20:18:04Z'),
      name: "Josi",
      responsible: DUMMY_RESPONSIBLE[0])
];

var DUMMY_RESERVEDTIME = [
  ReservedTime(
      start: DateTime.parse('2023-09-25 11:00:04Z'),
      end: DateTime.parse('2023-09-25 12:00:04Z')),
  ReservedTime(
      start: DateTime.parse('2023-09-26 11:00:04Z'),
      end: DateTime.parse('2023-09-26 12:00:04Z')),
  ReservedTime(
      start: DateTime.parse('2023-09-27 11:00:04Z'),
      end: DateTime.parse('2023-09-27 12:00:04Z')),
  ReservedTime(
      start: DateTime.parse('2023-09-29 11:00:04Z'),
      end: DateTime.parse('2023-09-29 12:00:04Z')),
  ReservedTime(
      start: DateTime.parse('2023-09-30 11:00:04Z'),
      end: DateTime.parse('2023-09-30 12:00:04Z')),
];
var DUMMY_CLASS = [
  ClassStore(
    residential: true,
    paymentAmount: 60.0,
    student: DUMMY_STUDENT[0],
    teacher: DUMMY_TEACHERS[0],
    subject: 'Geografia',
    status: 'notStarted',
    time: DUMMY_RESERVEDTIME[0],
  ),
  ClassStore(
      residential: true,
      paymentAmount: 60.0,
      student: DUMMY_STUDENT[1],
      subject: 'Matemática',
      teacher: DUMMY_TEACHERS[0],
      time: DUMMY_RESERVEDTIME[1],
      status: 'notStarted'),
  ClassStore(
      residential: true,
      paymentAmount: 60.0,
      student: DUMMY_STUDENT[0],
      subject: 'Geografia',
      teacher: DUMMY_TEACHERS[0],
      time: DUMMY_RESERVEDTIME[2],
      status: 'notStarted'),
  ClassStore(
      residential: true,
      paymentAmount: 60.0,
      student: DUMMY_STUDENT[1],
      subject: 'Matemática',
      teacher: DUMMY_TEACHERS[0],
      time: DUMMY_RESERVEDTIME[3],
      status: 'notStarted'),
  ClassStore(
      residential: true,
      paymentAmount: 60.0,
      student: DUMMY_STUDENT[0],
      subject: 'Geografia',
      teacher: DUMMY_TEACHERS[0],
      time: DUMMY_RESERVEDTIME[4],
      status: 'notStarted'),
  ClassStore(
      residential: true,
      paymentAmount: 60.0,
      student: DUMMY_STUDENT[1],
      subject: 'Matemática',
      teacher: DUMMY_TEACHERS[0],
      time: DUMMY_RESERVEDTIME[0],
      status: 'notStarted')
];
