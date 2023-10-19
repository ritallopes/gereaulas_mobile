import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/components/drawer_nav.dart';
import 'package:gereaulas_mobile/components/student_item.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/student_list.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StudentPage extends StatefulWidget {
  const StudentPage();

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late UserStore userStore;
  late StudentListStore studentListStore;
  late ClassListStore classListStore;

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);
    studentListStore = Provider.of<StudentListStore>(context);
    classListStore = Provider.of<ClassListStore>(context);

    final myStudents =
        studentListStore.findByTeacher(userStore.email, classListStore);

    return Scaffold(
        appBar: AppBar(title: Text("Alunos")),
        drawer: MainDrawer(),
        body: Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: myStudents.length,
              itemBuilder: (ctx, index) {
                return StudentItem(myStudents[index]);
              },
            ),
          );
        }));
  }
}
