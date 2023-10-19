import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/domain/student.dart';

class StudentItem extends StatefulWidget {
  late Student item;
  StudentItem(this.item);

  @override
  State<StudentItem> createState() => _StudentItemState();
}

class _StudentItemState extends State<StudentItem> {
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
  late Student item;
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
                height: 40,
                width: 40,
                child: Image.asset(
                  "assets/images/profile.png",
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(item.name,
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
            item.address,
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.family_restroom,
              color: Theme.of(context).colorScheme.primary),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.responsible?.name ?? 'Sem responsável cadastrado',
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.phone_android,
              color: Theme.of(context).colorScheme.primary),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item?.contato ?? 'Sem contato cadastrado',
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        )
      ]),
    ]);
  }
}
