import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/database/db_helper.dart';
import 'package:gereaulas_mobile/database/images_db.dart';
import 'package:gereaulas_mobile/database/reserved_time_db.dart';
import 'package:gereaulas_mobile/database/teachers_db.dart';
import 'package:gereaulas_mobile/database/users_db.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/r_time_t_list.store.dart';
import 'package:gereaulas_mobile/models/stores/responsible_list.store.dart';
import 'package:gereaulas_mobile/models/stores/student_list.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher_list.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/screens/add_class.dart';
import 'package:gereaulas_mobile/screens/class_page.dart';
import 'package:gereaulas_mobile/screens/home_teacher.dart';
import 'package:gereaulas_mobile/screens/login_page.dart';
import 'package:gereaulas_mobile/screens/main_page.dart';
import 'package:gereaulas_mobile/screens/register_users.dart';
import 'package:gereaulas_mobile/screens/schedule_page.dart';
import 'package:gereaulas_mobile/screens/student_page.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:gereaulas_mobile/utils/theme/theme_app.dart';
import 'package:provider/provider.dart';

import 'package:flutter/widgets.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    print(dbHelper.database);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => UserStore()),
        Provider<TeacherStore>(create: (_) => TeacherStore()),
        Provider<ResponsibleListStore>(create: (_) => ResponsibleListStore()),
        Provider<TeacherStoreList>(create: (_) => TeacherStoreList()),
        Provider<ClassListStore>(create: (_) => ClassListStore()),
        Provider<StudentListStore>(create: (_) => StudentListStore()),
        Provider<TimeListStore>(create: (_) => TimeListStore()),
      ],
      child: MaterialApp(
        title: 'GereAulas',
        theme: ThemeApp.themeData,
        initialRoute: '/',
        routes: {
          Routes.LOGIN_PAGE: (context) => const LoginPage(),
          Routes.MAIN_PAGE: (context) => MainScreen(),
          Routes.HOME_TEACHER: (context) => const HomeTeacherPage(),
          Routes.CLASS_PAGE: (context) => ClassPage(),
          Routes.STUDENT_PAGE: (context) => const StudentPage(),
          Routes.SCHEDULE_PAGE: (context) => const SchedulePage(),
          Routes.ADD_CLASS: (context) => const AddClassPage(),
          Routes.REGISTER_PAGE: (context) => const RegisterUserPage(),
        },
      ),
    );
  }
}
