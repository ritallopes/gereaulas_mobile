import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/components/class_item.dart';
import 'package:gereaulas_mobile/data/dummy.dart';
import 'package:gereaulas_mobile/models/user.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';

class ClassPage extends StatelessWidget {
  final User _user;
  ClassPage(this._user);

  @override
  Widget build(BuildContext context) {
    final classSchedules = DUMMY_CLASS.where((c) {
      String teacherEmail = c.teacher.email;
      return teacherEmail.contains(_user.email);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Aulas")),
      drawer: ClassDrawer(),
      body: ListView.builder(
          itemCount: classSchedules.length,
          itemBuilder: (ctx, index) {
            return ClassItem(classSchedules[index]);
          }),
    );
  }
}

class ClassDrawer extends StatelessWidget {
  const ClassDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/imgs/background.png",
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Text(
              "Gerencie suas aulas",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.MAIN_PAGE);
            },
          ),
          ListTile(
            title: const Text('Adicionar aulas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.STUDENT_PAGE);
            },
          ),
          ListTile(
            title: const Text('Seus alunos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.STUDENT_PAGE);
            },
          ),
          ListTile(
            title: const Text('Assuntos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.STUDENT_PAGE);
            },
          )
        ],
      ),
    );
  }
}
