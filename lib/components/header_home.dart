import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/domain/teacher.dart';
import 'package:gereaulas_mobile/utils/queries/user.dart';

class HeaderHome extends StatelessWidget {
  Teacher teacher;
  HeaderHome({required this.teacher, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                "assets/images/example_profile.png",
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Prof ${teacher.name}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Você tem ${countClassByTeacherToday(teacher).toString()} aulas hoje",
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              )),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     child: Image.asset(
          //       "assets/images/logo_ga.png",
          //     ),
          //     decoration: const BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(Radius.circular(15)),
          //     ),
          //     height: 60,
          //     width: 60,
          //   ),
          // ),
        ],
      ),
    );
  }
}
