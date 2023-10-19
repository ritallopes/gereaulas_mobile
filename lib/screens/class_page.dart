import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gereaulas_mobile/components/class_item.dart';
import 'package:gereaulas_mobile/components/drawer_nav.dart';

import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:provider/provider.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  late UserStore userStore;
  late ClassListStore classListStore;
  @override
  void initState() {
    super.initState();
  }

  Map<String, List<ClassStore>> groupBy(List<ClassStore> values) {
    var map = <String, List<ClassStore>>{};
    for (var classElement in values) {
      map['${classElement.time.start.day}/${classElement.time.start.month}/${classElement.time.start.year}']!
          .add(classElement);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);
    classListStore = Provider.of<ClassListStore>(context);

    return Scaffold(
        appBar: AppBar(title: const Text("Aulas")),
        drawer: MainDrawer(),
        body: Observer(builder: (_) {
          var classSchedules = Provider.of<ClassListStore>(context)
              .findByTeacher(userStore.email);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: classSchedules.length,
              itemBuilder: (ctx, index) {
                return ClassItem(classSchedules[index]);
              },
            ),
          );
        }));
  }
}
