import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/app_widget.dart';
import 'package:gereaulas_mobile/components/menu_bar.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/screens/class_page.dart';
import 'package:gereaulas_mobile/screens/home_teacher.dart';
import 'package:gereaulas_mobile/screens/student_page.dart';
import 'package:gereaulas_mobile/utils/theme/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';

class MainScreen extends StatefulWidget {
  MainScreen();
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> pages;
  late UserStore userStore;
  int _selectedIndex = 0;

  late bool hasInternet;
  late bool showConnectionMessage;

  @override
  void initState() {
    pages = const [HomeTeacherPage(), ClassPage(), StudentPage()];
    hasInternet = true;
    showConnectionMessage = false;
    super.initState();
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    print(connectivityResult);
    setState(() {
      hasInternet = (connectivityResult != ConnectivityResult.none);
    });

    if (!hasInternet) {
      setState(() {
        showConnectionMessage = true;
      });

      Timer(Duration(seconds: 3), () {
        setState(() {
          showConnectionMessage = false;
        });
      });
    }
  }

  void selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);

    return showConnectionMessage
        ? MaterialApp(
            theme: ThemeApp.themeData,
            home: const Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: const Text("Sem conexão"),
                ),
              ),
            ),
          )
        : userStore.isAuthenticated
            ? MaterialApp(
                theme: ThemeApp.themeData,
                home: Scaffold(
                  body: pages[_selectedIndex],
                  bottomNavigationBar:
                      MenuNavigationBar(_selectedIndex, selectIndex),
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
                        child: const Text("Realizar Login"),
                      ),
                    ),
                  ),
                ),
              );
  }
}
