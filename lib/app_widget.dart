import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/user.dart';
import 'package:gereaulas_mobile/screens/class_page.dart';
import 'package:gereaulas_mobile/screens/home_page.dart';
import 'package:gereaulas_mobile/screens/login_page.dart';
import 'package:gereaulas_mobile/screens/main_page.dart';
import 'package:gereaulas_mobile/screens/student_page.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:gereaulas_mobile/utils/theme/theme_app.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late User _user;

  _setUser(User u) {
    if (u.email.isNotEmpty) {
      _user = u;
    }
    print(u);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GereAulas',
      theme: ThemeApp.themeData,
      initialRoute: '/',
      routes: {
        Routes.LOGIN_PAGE: (context) => LoginPage(_setUser),
        Routes.MAIN_PAGE: (context) => MainScreen(_user),
        Routes.HOME_PAGE: (context) => HomePage(_user),
        Routes.CLASS_PAGE: (context) => ClassPage(_user),
        Routes.STUDENT_PAGE: (context) => StudentPage(_user),
      },
    );
  }
}
