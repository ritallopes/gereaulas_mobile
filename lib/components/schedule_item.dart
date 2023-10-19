import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/stores/reserved_time_teacher.store.dart';

class ScheduleItem extends StatefulWidget {
  late ReservedTimeTeacherStore item;
  ScheduleItem(this.item, {super.key});

  @override
  State<ScheduleItem> createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Card(
            child: SizedBox(
              child: Center(child: CardItem(widget.item)),
            ),
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  late ReservedTimeTeacherStore item;
  CardItem(this.item, {super.key});

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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Row(
          children: [
            Icon(Icons.calendar_today,
                color: Theme.of(context).colorScheme.primary, size: 18.0),
            const SizedBox(
              width: 5,
            ),
            Text(
              formatTime(item.reservedTime),
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Icon(
              item.isOccupied
                  ? Icons.lock_clock_outlined
                  : Icons.collections_bookmark_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 18.0,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              item.isOccupied ? 'Horário Ocupado' : 'Horário Livre',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      )
    ]);
  }
}
