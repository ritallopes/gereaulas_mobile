import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';

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
            title: const Text('Assuntos das aulas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.MAIN_PAGE);
            },
          ),
           ListTile(
            title: const Text('Seus alunos'),
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
