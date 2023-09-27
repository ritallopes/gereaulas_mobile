import 'package:gereaulas_mobile/data/dummy.dart';
import 'package:gereaulas_mobile/models/class_schedule.dart';
import 'package:gereaulas_mobile/models/teacher.dart';
import 'package:gereaulas_mobile/models/user.dart';

Teacher getUserTeacher(User _user) {
  for (var t in DUMMY_TEACHERS) {
    if (t.email == _user.email) return t;
  }
  return new Teacher();
}

List<ClassSchedule> getClassTeacher(Teacher _teacher) {
  List<ClassSchedule> items = [];

  for (var c in DUMMY_CLASS) {
    if (_teacher.email == c.teacher.email) {
      items.add(c);
    }
  }
  return items;
}

int countClassByTeacherToday(Teacher teacher) {
  int count = 0;
  final now = DateTime.now();
  for (var c in DUMMY_CLASS) {
    bool classToday = differenceBetweenDate(now, c.time.start) == 0;
    print(differenceBetweenDate(now, c.time.start));
    if (teacher.email == c.teacher.email && classToday) {
      count++;
    }
  }
  return count;
}

int differenceBetweenDate(DateTime d1, DateTime d2) {
  print(DateTime(d2.year, d2.month, d2.day));
  return DateTime(d2.year, d2.month, d2.day)
      .difference(DateTime(d1.year, d1.month, d1.day))
      .inDays;
}

List<String> subjectsClassToday(Teacher teacher) {
  List<String> subjects = [];
  final now = DateTime.now();
  for (var c in DUMMY_CLASS) {
    bool classToday = differenceBetweenDate(now, c.time.start) == 0;

    if (teacher.email == c.teacher?.email && classToday) {
      subjects.add(c.subject);
    }
  }
  return subjects;
}
