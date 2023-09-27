import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/class_schedule.dart';

class ClassItem extends StatefulWidget {
  late ClassSchedule item;
  ClassItem(this.item);

  @override
  State<ClassItem> createState() => _ClassItemState();
}

class _ClassItemState extends State<ClassItem> {
  @override
  Widget build(BuildContext context) {
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
  late ClassSchedule item;
  CardItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Container(
                child: Image.asset(
                  "assets/imgs/example_profile.png",
                ),
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 5,
              ),
              Text(item.student.name,
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
            item.student.address,
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
            "${item.time.start.hour}:${item.time.start.minute} - ${item.time.start.hour}:${item.time.start.minute} ",
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ),
      ]),
    ]);
  }
}
