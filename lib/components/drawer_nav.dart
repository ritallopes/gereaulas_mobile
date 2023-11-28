import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/app_widget.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/screens/add_class.dart';
import 'package:gereaulas_mobile/screens/class_page.dart';
import 'package:gereaulas_mobile/screens/main_page.dart';
import 'package:gereaulas_mobile/screens/schedule_page.dart';
import 'package:gereaulas_mobile/screens/student_page.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  late UserStore userStore;

  MainDrawer();

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/background.png",
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Text(
              "GereAulas",
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Ver Alunos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Ver Aulas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Agendar Aulas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddClassPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Organizar Horários'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchedulePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () {
              userStore.logout();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          )
        ],
      ),
    );
    
  }
}
