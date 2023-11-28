import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:provider/provider.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({super.key});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  late ClassListStore classListStore;
  double quantClassToday = 0.0;
  double quantClassFinished = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    classListStore = Provider.of<ClassListStore>(context);
    quantClassFinished =
        classListStore.getClassTeacherTodayFinished.length.toDouble();
    quantClassToday = classListStore.getClassTeacherToday.length.toDouble();

    if (quantClassToday > 0) {
      return Column(
        children: [
          if (quantClassToday > 0)
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: quantClassFinished / quantClassToday,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          Container(
              child: Text(
            "Você já concluiu $quantClassFinished/$quantClassToday aulas",
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ))
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
