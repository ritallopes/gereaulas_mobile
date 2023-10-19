import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gereaulas_mobile/components/drawer_nav.dart';
import 'package:gereaulas_mobile/components/schedule_item.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:gereaulas_mobile/models/stores/r_time_t_list.store.dart';
import 'package:gereaulas_mobile/models/stores/reserved_time_teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/utils/queries/user.dart';
import 'package:intl/intl.dart';
import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/domain/teacher.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late UserStore userStore;
  late RTimeRListStore rTimeRListStore;

  final _dateFormat = DateFormat('dd/MM/yyyy');
  final _timeFormat = DateFormat('HH:mm');
  late ReservedTimeTeacherStore newReservedTime;

  @override
  void initState() {
    newReservedTime = ReservedTimeTeacherStore(
        reservedTime: ReservedTime(start: DateTime.now(), end: DateTime.now()),
        teacher: new Teacher());
    super.initState();
  }

  setNewReservedTime(String email) {
    setState(() {
      newReservedTime.teacher = getUserTeacher(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);
    rTimeRListStore = Provider.of<RTimeRListStore>(context);
    setNewReservedTime(userStore.email);

    getClassTeacherEmail(newReservedTime.teacher.email).forEach((e) =>
        rTimeRListStore.addReservedTimeTeacher(
            ReservedTime(start: e.classTime.start, end: e.classTime.end),
            newReservedTime.teacher,
            true));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Horário'),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Data de Início'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_dateFormat
                              .format(newReservedTime.reservedTime.start)),
                          TextButton(
                            onPressed: _selectStartDate,
                            child: const Icon(
                              Icons.calendar_today,
                              size: 24.0,
                              semanticLabel: 'Definir Início',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Hora de Início'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_timeFormat
                              .format(newReservedTime.reservedTime.start)),
                          TextButton(
                            onPressed: _selectStartTime,
                            child: const Icon(
                              Icons.lock_clock,
                              size: 24.0,
                              semanticLabel: 'Definir Início',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Data de Fim'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_dateFormat
                              .format(newReservedTime.reservedTime.end)),
                          TextButton(
                            onPressed: _selectEndDate,
                            child: const Icon(
                              Icons.calendar_today,
                              size: 24.0,
                              semanticLabel: 'Definir Fim',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hora de Fim'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_timeFormat
                              .format(newReservedTime.reservedTime.end)),
                          TextButton(
                            onPressed: _selectEndTime,
                            child: const Icon(
                              Icons.lock_clock,
                              size: 24.0,
                              semanticLabel: 'Definir Fim',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('Ocupado'),
                  value: true,
                  groupValue: newReservedTime.isOccupied,
                  onChanged: (value) {
                    setState(() {
                      newReservedTime.isOccupied = value as bool;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Livre'),
                  value: false,
                  groupValue: newReservedTime.isOccupied,
                  onChanged: (value) {
                    setState(() {
                      newReservedTime.isOccupied = value as bool;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              width: 50,
              height: 40,
              child: ElevatedButton(
                  onPressed: () => saveSchedule(ReservedTimeTeacherStore(
                      reservedTime: newReservedTime.reservedTime,
                      teacher: newReservedTime.teacher,
                      isOccupied: newReservedTime.isOccupied)),
                  child: const Text("Salvar Horário")),
            ),
            const SizedBox(height: 20),
            const Text('Horários:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Observer(builder: (_) {
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  itemCount: rTimeRListStore.reservedTimeList.length,
                  itemBuilder: (context, index) {
                    var scheduledTime = rTimeRListStore.reservedTimeList[index];
                    return ScheduleItem(scheduledTime);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  void saveSchedule(ReservedTimeTeacherStore reserved) {
    rTimeRListStore.addReservedTimeTeacher(
        reserved.reservedTime, reserved.teacher, reserved.isOccupied);
  }

  void _selectStartDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: newReservedTime.reservedTime.start,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null &&
        pickedDate != newReservedTime.reservedTime.start) {
      setState(() {
        newReservedTime.reservedTime.start = pickedDate;
      });
    }
  }

  void _selectStartTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(newReservedTime.reservedTime.start),
    );
    if (pickedTime != null) {
      setState(() {
        newReservedTime.reservedTime.start = DateTime(
          newReservedTime.reservedTime.start.year,
          newReservedTime.reservedTime.start.month,
          newReservedTime.reservedTime.start.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  void _selectEndDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: newReservedTime.reservedTime.end,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != newReservedTime.reservedTime.end) {
      setState(() {
        newReservedTime.reservedTime.end = pickedDate;
      });
    }
  }

  void _selectEndTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(newReservedTime.reservedTime.end),
    );
    if (pickedTime != null) {
      setState(() {
        newReservedTime.reservedTime.end = DateTime(
          newReservedTime.reservedTime.end.year,
          newReservedTime.reservedTime.end.month,
          newReservedTime.reservedTime.end.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }
}
