import 'package:gereaulas_mobile/models/reserved_time.dart';
import 'package:gereaulas_mobile/models/student.dart';
import 'package:gereaulas_mobile/models/teacher.dart';

class ClassSchedule {
  ReservedTime time;
  Student student;
  Teacher teacher;
  bool residential;
  double paymentAmount;
  String subject;
  bool finished;

  ClassSchedule(
      {required this.time,
      required this.student,
      required this.teacher,
      this.residential = true,
      this.paymentAmount = 0,
      this.subject = '',
      this.finished = false});
}
