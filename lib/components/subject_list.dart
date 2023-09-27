import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/teacher.dart';
import 'package:gereaulas_mobile/utils/queries/user.dart';

class SubjectList extends StatefulWidget {
  late Teacher teacher;
  List<String> subjects = [];

  SubjectList(this.teacher) {
    subjects = subjectsClassToday(teacher);
  }

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.subjects.length,
        itemBuilder: (ctx, index) {
          return Text(widget.subjects[index]);
        });
    ;
  }
}
