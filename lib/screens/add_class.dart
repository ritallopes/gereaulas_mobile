import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/components/app_bar.dart';
import 'package:gereaulas_mobile/components/drawer_nav.dart';

import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:gereaulas_mobile/models/stores/student.store.dart';
import 'package:gereaulas_mobile/models/stores/student_list.store.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/screens/class_page.dart';
import 'package:provider/provider.dart';

class AddClassPage extends StatefulWidget {
  const AddClassPage();

  @override
  State<AddClassPage> createState() => _AddClassPageState();
}

class _AddClassPageState extends State<AddClassPage> {
  late UserStore userStore;

  late TeacherStore teacher;
  late ClassListStore classListStore;

  List<StudentStore> students = [];
  Map<String, Object> formData = Map<String, Object>();

  bool residentialIsChecked = true;
  @override
  void initState() {
    residentialIsChecked = true;
    formData = Map<String, Object>();
    super.initState();
  }

  final _residentialFocus = FocusNode();
  final _paymentAmountFocus = FocusNode();
  final _subjectFocus = FocusNode();
  final _studentFocus = FocusNode();

  final _submitFocus = FocusNode();

  DateTime date_init = DateTime.now();
  DateTime date_end = DateTime.now();

  TimeOfDay time_init = TimeOfDay.now();
  TimeOfDay time_end = TimeOfDay.now();

  void submit() {
    ReservedTime time = ReservedTime(
        start: DateTime(date_init.year, date_init.month, date_init.day,
            time_init.hour, time_init.minute),
        end: DateTime(date_end.year, date_end.month, date_end.day,
            time_end.hour, time_end.minute));
    formData['time'] = time;
    classListStore.addClassFromFields(
      time: time,
      student: formData['student'] as StudentStore,
      teacher: formData['teacher'] as TeacherStore,
      residential: formData['residential'] as bool,
      paymentAmount: double.parse(formData['paymentAmount'].toString()),
      subject: formData['subject'].toString(),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ClassPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);
    students = Provider.of<StudentListStore>(context).students.toList();

    classListStore = Provider.of<ClassListStore>(context);
    teacher = Provider.of<TeacherStore>(context);

    formData['teacher'] = teacher;
    //TODO
    formData['status'] = 'notStarted';
    formData['residential'] = true;

    _showDateInitPicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2024))
          .then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          date_init = pickedDate;
        });
      });
    }

    _showTimeInitPicker() {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          time_init = pickedDate;
        });
      });
    }

    _showDateEndPicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          date_end = pickedDate;
        });
      });
    }

    _showTimeEndPicker() {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          time_end = pickedDate;
        });
      });
    }

    return Scaffold(
      appBar: AppBarCustom(pageTitle: "Marcar aula"),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              children: <Widget>[
                Expanded(
                  child: Text('Defina o Horário'),
                ),
              ],
            ),
            const Row(
              children: <Widget>[
                Expanded(
                  child: Text('Início'),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: Text(
                      '${date_init.day}/${date_init.month}/${date_init.year}'),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: _showDateInitPicker,
                    child: const Icon(
                      Icons.calendar_today,
                      size: 24.0,
                      semanticLabel: 'Definir Início',
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                const Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: Text('${time_init.hour}:${time_init.minute}'),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: _showTimeInitPicker,
                    child: const Icon(Icons.lock_clock,
                        size: 24.0, semanticLabel: 'Definir Início'),
                  ),
                )
              ],
            ),
            const Row(
              children: <Widget>[
                Expanded(
                  child: Text('Final'),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: Text(
                      '${date_end.day}/${date_end.month}/${date_end.year}'),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: _showDateEndPicker,
                    child: const Icon(Icons.calendar_today,
                        size: 24.0, semanticLabel: 'Definir Final'),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                const Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: Text('${time_end.hour}:${time_end.minute}'),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: _showTimeEndPicker,
                    child: const Icon(Icons.lock_clock,
                        size: 24.0, semanticLabel: 'Definir Horário final'),
                  ),
                )
              ],
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
            ),

            //Estudante dropdown
            DropdownButtonFormField(
              value: formData['student']?.toString(),
              focusNode: _studentFocus,
              hint: Text(formData.containsKey('student')
                  ? ((formData['student']) as StudentStore).name
                  : "Selecione o estudante"),
              items: students
                  .map((e) => DropdownMenuItem(
                      child: Text(e.name.toString()), value: e))
                  .toList(),
              onChanged: (student) => formData['student'] = student ?? '',
              validator: (_student) {
                final student = _student ?? '';

                if ((student as StudentStore).email != '') {
                  return 'Obrigatório';
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Estudante',
              ),
              onSaved: (student) => formData['student'] = student ?? '',
            ),
            TextFormField(
              initialValue: formData['subject']?.toString(),
              decoration: const InputDecoration(
                labelText: 'Assunto',
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              focusNode: _subjectFocus,
              onChanged: (subject) => formData['subject'] = subject ?? '',
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_paymentAmountFocus);
              },
              onSaved: (subject) => formData['subject'] = subject ?? '',
              validator: (_subject) {
                final subject = _subject ?? '';

                if (subject.trim().isEmpty) {
                  return 'Obrigatório';
                }

                return null;
              },
            ),
            TextFormField(
              initialValue: formData['paymentAmount']?.toString(),
              decoration: const InputDecoration(
                labelText: 'Valor da aula R\$',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_residentialFocus);
              },
              onSaved: (paymentAmount) =>
                  formData['paymentAmount'] = paymentAmount ?? '',
              onChanged: (paymentAmount) =>
                  formData['paymentAmount'] = paymentAmount ?? '',
              validator: (_paymentAmount) {
                final paymentAmount = _paymentAmount ?? '';

                if (paymentAmount.trim().isEmpty) {
                  return 'Obrigatório';
                }

                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 0.0, 5.0),
              child: Row(
                children: [
                  Checkbox(
                    focusNode: _residentialFocus,
                    value: residentialIsChecked,
                    onChanged: (residential) {
                      formData['residential'] = residential ?? '';
                      setState(() {
                        residentialIsChecked = residential ?? false;
                      });
                    },
                  ),
                  const Text("A aula acontecerá no endereço do aluno")
                ],
              ),
            ),
            !residentialIsChecked
                ? TextFormField(
                    initialValue: formData['address']?.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Endereço',
                    ),
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_submitFocus);
                    },
                    onSaved: (address) => formData['address'] = address ?? '',
                  )
                : Center(),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  focusNode: _submitFocus,
                  onPressed: submit,
                  child: const Text("Agendar aula")),
            )
          ],
        ),
      ),
    );
  }
}
