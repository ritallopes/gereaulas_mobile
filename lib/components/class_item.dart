import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gereaulas_mobile/components/clone_dialog.dart';
import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/student.store.dart';
import 'package:gereaulas_mobile/models/stores/student_list.store.dart';
import 'package:provider/provider.dart';

class ClassItem extends StatefulWidget {
  late ClassStore item;
  ClassItem(this.item, {super.key});

  @override
  State<ClassItem> createState() => _ClassItemState();
}

class _ClassItemState extends State<ClassItem> {
  @override
  Widget build(BuildContext context) {
    print("Item " + widget.item.toString());
    return Column(
      children: <Widget>[
        Center(
          child: Card(
            child: SizedBox(
              width: 300,
              child: Center(child: CardItem(widget.item)),
            ),
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  late ClassStore item;
  late ClassListStore classListStore;
  late StudentListStore studentListStore;

  CardItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    classListStore = Provider.of<ClassListStore>(context);
    studentListStore = Provider.of<StudentListStore>(context);

    StudentStore student = studentListStore.findById(item.student);

    String formatTime(ReservedTime time) {
      String start =
          '${time.start.day.toString().padLeft(2, '0')}/${time.start.month.toString().padLeft(2, '0')}/${time.start.year} ${time.start.hour.toString().padLeft(2, '0')}:${time.start.minute.toString().padLeft(2, '0')} - ';
      String end = time.start.day == time.end.day &&
              time.start.month == time.end.month &&
              time.start.year == time.end.year
          ? ''
          : '${time.end.day.toString().padLeft(2, '0')}/${time.end.month.toString().padLeft(2, '0')}/${time.end.year}';
      end +=
          ' ${time.end.hour.toString().padLeft(2, '0')}:${time.end.minute.toString().padLeft(2, '0')}';

      return start + end;
    }

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(
                  "assets/images/profile.png",
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(student.name ?? 'Nome',
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ]),
          ),
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.maps_home_work,
              color: Theme.of(context).colorScheme.primary),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            student?.address ?? 'Sem endereço cadastrado',
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        )
      ]),
      const Divider(
        thickness: 1,
        indent: 0,
        endIndent: 0,
        color: Colors.black54,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Icon(Icons.timer, color: Theme.of(context).colorScheme.primary),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            formatTime(item.time),
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Icon(Icons.subject, color: Theme.of(context).colorScheme.primary),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.subject,
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ),
      ]),
      Observer(builder: (_) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 70,
                  height: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CloneDialog(
                            itemSource: item,
                          );
                        },
                      );
                    },
                    child: const Text('Clonar', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
              item.status != 'finished'
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 70,
                        height: 20,
                        child: ElevatedButton(
                          onPressed: () {
                            String status = item.status == 'notStarted'
                                ? 'started'
                                : 'finished';
                            classListStore.changeStatus(item, status);
                          },
                          child: Text(
                              item.status == 'notStarted'
                                  ? 'Iniciar'
                                  : 'Finalizar',
                              style: const TextStyle(fontSize: 12)),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.check,
                          color: Theme.of(context).colorScheme.primary),
                    ),
            ]);
      }),
    ]);
  }
}
