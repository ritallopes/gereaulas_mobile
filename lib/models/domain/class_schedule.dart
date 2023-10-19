import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/domain/student.dart';
import 'package:gereaulas_mobile/models/domain/teacher.dart';

class ClassSchedule {
  ReservedTime time;
  Student student;
  Teacher teacher;
  bool residential;
  double paymentAmount;
  String subject;
  String status; //not started, started, finished

  ClassSchedule(
      {required this.time,
      required this.student,
      required this.teacher,
      this.residential = true,
      this.paymentAmount = 0,
      this.subject = '',
      this.status = ''});

  @override
  String toString() {
    return 'ClassSchedule{'
        'time: $time, '
        'student: $student, '
        'teacher: $teacher, '
        'residential: $residential, '
        'paymentAmount: $paymentAmount, '
        'subject: $subject, '
        'status: $status}';
  }
}
