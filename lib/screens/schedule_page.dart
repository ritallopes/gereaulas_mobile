import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gereaulas_mobile/components/app_bar.dart';
import 'package:gereaulas_mobile/components/drawer_nav.dart';
import 'package:gereaulas_mobile/components/schedule_item.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/r_time_t_list.store.dart';
import 'package:gereaulas_mobile/models/stores/reserved_time_teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late UserStore userStore;
  late TeacherStore teacherStore;

  late TimeListStore rTimeRListStore;

  final _dateFormat = DateFormat('dd/MM/yyyy');
  final _timeFormat = DateFormat('HH:mm');
  late ReservedTimeTeacherStore newReservedTime;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    teacherStore = Provider.of<TeacherStore>(context);
    newReservedTime = ReservedTimeTeacherStore(
        start: DateTime.now(),
        endTime: DateTime.now(),
        teacher: teacherStore,
        isOccupied: false);
  }

  @override
  void initState() {
    super.initState();
  }

  setNewReservedTime(String email) {
    setState(() {
      newReservedTime.teacher = teacherStore;
    });
  }

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);
    rTimeRListStore = Provider.of<TimeListStore>(context);
    teacherStore = Provider.of<TeacherStore>(context);

    setNewReservedTime(userStore.email);

    return Scaffold(
      appBar: AppBarCustom(pageTitle: "Agendar Horário"),
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
                          Text(_dateFormat.format(newReservedTime.start)),
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
                          Text(_timeFormat.format(newReservedTime.start)),
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
                      const Text('Data de Fim'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_dateFormat.format(newReservedTime.endTime)),
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
                          Text(_timeFormat.format(newReservedTime.endTime)),
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
                  onPressed: () => saveSchedule(newReservedTime),
                  child: const Text("Salvar Horário")),
            ),
            const SizedBox(height: 20),
            const Text('Horários:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Observer(builder: (_) {
              var timesList = ObservableList.of(
                  rTimeRListStore.findByTeacherEmail(userStore.email));

              return timesList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        shrinkWrap: true,
                        itemCount: timesList.length,
                        itemBuilder: (context, index) {
                          var scheduledTime = timesList[index];
                          return ScheduleItem(scheduledTime);
                        },
                      ),
                    )
                  : const Center(
                      child: Text(
                        "Você não tem horários agendados",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    );
              ;
            }),
          ],
        ),
      ),
    );
  }

  void saveSchedule(ReservedTimeTeacherStore reserved) {
    rTimeRListStore.addReservedTimeStoreTeacher(reserved);
  }

  void _selectStartDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: newReservedTime.start,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != newReservedTime.start) {
      setState(() {
        newReservedTime.start = pickedDate;
      });
    }
  }

  void _selectStartTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(newReservedTime.start),
    );
    if (pickedTime != null) {
      setState(() {
        newReservedTime.start = DateTime(
          newReservedTime.start.year,
          newReservedTime.start.month,
          newReservedTime.start.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  void _selectEndDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: newReservedTime.endTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != newReservedTime.endTime) {
      setState(() {
        newReservedTime.endTime = pickedDate;
      });
    }
  }

  void _selectEndTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(newReservedTime.endTime),
    );
    if (pickedTime != null) {
      setState(() {
        newReservedTime.endTime = DateTime(
          newReservedTime.endTime.year,
          newReservedTime.endTime.month,
          newReservedTime.endTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }
}
