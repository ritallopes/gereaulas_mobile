import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/components/app_bar.dart';
import 'package:gereaulas_mobile/components/circular_progress.dart';
import 'package:gereaulas_mobile/components/header_home.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/student_list.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/screens/class_page.dart';
import 'package:provider/provider.dart';
import 'package:gereaulas_mobile/components/drawer_nav.dart';

class HomeTeacherPage extends StatefulWidget {
  const HomeTeacherPage({super.key});

  @override
  State<HomeTeacherPage> createState() => _HomeTeacherPageState();
}

class _HomeTeacherPageState extends State<HomeTeacherPage> {
  late UserStore userStore;
  late TeacherStore teacherStore;
  late StudentListStore studentListStore;

  late ClassListStore classStoreList;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userStore = Provider.of<UserStore>(context);
    teacherStore = Provider.of<TeacherStore>(context);
    classStoreList = Provider.of<ClassListStore>(context);
    studentListStore = Provider.of<StudentListStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBarCustom(pageTitle: "Home"),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: HeaderHome(teacher: teacherStore),
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: classStoreList.getClassTeacherToday.isNotEmpty
                      ? const Row(children: [
                          /*Expanded(
                            flex: 3,
                            child: Text(
                              "Próxima aula: ${studentListStore.findById(classStoreList.allClass.first.student)}",
                              style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),*/
                          Expanded(flex: 2, child: CircularProgress()),
                        ])
                      : const Text(
                          "Você não tem aula agendada para hoje",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 50,
                        child: Text(
                          'Organize suas aulas',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                        child: Text(
                          "O GereAulas te ajuda a organizar suas aulas",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClassPage()),
                              );
                            },
                            child: const Text("Aulas de hoje")),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
