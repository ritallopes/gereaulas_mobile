import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/domain/user.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/r_time_t_list.store.dart';
import 'package:gereaulas_mobile/models/stores/student_list.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/screens/add_class.dart';
import 'package:gereaulas_mobile/screens/class_page.dart';
import 'package:gereaulas_mobile/screens/home_page.dart';
import 'package:gereaulas_mobile/screens/login_page.dart';
import 'package:gereaulas_mobile/screens/main_page.dart';
import 'package:gereaulas_mobile/screens/schedule_page.dart';
import 'package:gereaulas_mobile/screens/student_page.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:gereaulas_mobile/utils/theme/theme_app.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

final userStore = UserStore();

class _MyAppState extends State<MyApp> {
  late User _user;

  @override
  void initState() {
    super.initState();
  }

  _setUser(User u) {
    if (u.email.isNotEmpty) {
      _user = u;
    }
    userStore.setEmail(u.email);
    userStore.setPassword(u.password);
    print('${userStore.email} - email');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => UserStore()),
        Provider<ClassListStore>(create: (_) => ClassListStore()),
        Provider<StudentListStore>(create: (_) => StudentListStore()),
        Provider<RTimeRListStore>(create: (_) => RTimeRListStore()),
      ],
      child: MaterialApp(
        title: 'GereAulas',
        theme: ThemeApp.themeData,
        initialRoute: '/',
        routes: {
          Routes.LOGIN_PAGE: (context) => LoginPage(_setUser),
          Routes.MAIN_PAGE: (context) => MainScreen(),
          Routes.HOME_PAGE: (context) => const HomePage(),
          Routes.CLASS_PAGE: (context) => ClassPage(),
          Routes.STUDENT_PAGE: (context) => const StudentPage(),
          Routes.SCHEDULE_PAGE: (context) => SchedulePage(),
          Routes.ADD_CLASS: (context) => const AddClassPage(),
        },
      ),
    );
  }
}
