import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/user.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';

class StudentPage extends StatefulWidget {
  final User _user;

  const StudentPage(this._user);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alunos")),
      drawer: StudentDrawer(),
      body: Container(
        child: const Text("Student Page"),
      ),
    );
  }
}

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({super.key});

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
              "Gerencie seus alunos",
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
            title: const Text('Assuntos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.STUDENT_PAGE);
            },
          )
        ],
      ),
    );
    ;
  }
}
