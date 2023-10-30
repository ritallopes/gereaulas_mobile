import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/app_widget.dart';
import 'package:gereaulas_mobile/components/drawer_nav.dart';
import 'package:gereaulas_mobile/components/menu_bar.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/screens/class_page.dart';
import 'package:gereaulas_mobile/screens/home_teacher.dart';
import 'package:gereaulas_mobile/utils/theme/theme_app.dart';
import 'package:gereaulas_mobile/screens/student_page.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen();
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> pages;
  late UserStore userStore;
  int _selectedIndex = 0;
  @override
  void initState() {
    pages = [HomeTeacherPage(), ClassPage(), StudentPage()];
    super.initState();
  }

  void selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);

    return userStore.isAuthenticated
        ? MaterialApp(
            theme: ThemeApp.themeData,
            home: Scaffold(
              appBar: AppBar(actions: [
                Image.asset(
                  "assets/images/logo_ga.png",
                ),
              ]),
              body: pages[_selectedIndex],
              bottomNavigationBar:
                  MenuNavigationBar(_selectedIndex, selectIndex),
              drawer: MainDrawer(),
            ),
          )
        : MaterialApp(
            theme: ThemeApp.themeData,
            home: Scaffold(
              body: Center(
                  child: Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                    child: const Text("Realizar Login")),
              )),
            ),
          );
  }
}
