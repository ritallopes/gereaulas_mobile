import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';

class SubjectList extends StatelessWidget {
  late TeacherStore teacher;
  late ClassListStore classListStore;
  List<String> subjects = [];

  SubjectList(this.teacher, this.classListStore, {super.key}) {
    subjects = classListStore.getSubjectsForTeacherOnCurrentDay(teacher.id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (ctx, index) {
          return Text(subjects[index]);
        });
  }
}
