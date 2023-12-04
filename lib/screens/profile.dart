import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/utils/utils_functions.dart';

class ProfilePage extends StatelessWidget {
  final TeacherStore teacherStore;

  const ProfilePage({Key? key, required this.teacherStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: teacherStore.image_profile.isEmpty
                      ? Image.asset(
                          "assets/images/example_profile.png",
                        )
                      : Image.asset(
                          "assets/images/example_profile.png",
                        )),
              const SizedBox(height: 5),
              Text(
                teacherStore.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () => launchEmail(teacherStore.email),
                child: Text(
                  teacherStore.email,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
