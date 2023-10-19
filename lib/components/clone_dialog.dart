import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gereaulas_mobile/models/domain/reserved_time.dart';
import 'package:gereaulas_mobile/models/stores/class.store.dart';
import 'package:gereaulas_mobile/models/stores/class_list.store.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CloneDialog extends StatefulWidget {
  ClassStore itemSource;
  CloneDialog({required this.itemSource, super.key});
  @override
  State<CloneDialog> createState() => _CloneDialogState();
}

class _CloneDialogState extends State<CloneDialog> {
  late ClassStore newClass;
  late ClassListStore classListStore;
  late Map<String, Object> formData = {};
  DateTime date_init = DateTime.now();
  DateTime date_end = DateTime.now();

  TimeOfDay time_init = TimeOfDay.now();
  TimeOfDay time_end = TimeOfDay.now();

  @override
  void initState() {
    date_init = widget.itemSource.classTime.start;
    date_end = widget.itemSource.classTime.end;

    time_init = TimeOfDay.fromDateTime(widget.itemSource.classTime.start);
    time_end = TimeOfDay.fromDateTime(widget.itemSource.classTime.end);
    super.initState();
  }

  submitClone() {
    ReservedTime time = ReservedTime(
        start: DateTime(date_init.year, date_init.month, date_init.day,
            time_init.hour, time_init.minute),
        end: DateTime(date_end.year, date_end.month, date_end.day,
            time_end.hour, time_end.minute));
    formData['time'] = time;

    classListStore.createClassFormData(formData);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    classListStore = Provider.of<ClassListStore>(context, listen: false);
    formData['student'] = widget.itemSource.classStudent;
    formData['residential'] = widget.itemSource.isResidential;
    formData['subject'] = widget.itemSource.classSubject;
    formData['teacher'] = widget.itemSource.classTeacher;
    formData['status'] = 'notStarted';
    formData['paymentAmount'] = widget.itemSource.classPaymentAmount;

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

    return AlertDialog(
      title: const Text('Clonar Aula'),
      titleTextStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      content: SingleChildScrollView(
        child: Column(children: [
          const Row(
            children: <Widget>[
              Expanded(
                child: Text('Início', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Spacer(flex: 1),
              Expanded(
                flex: 2,
                child: Text(
                  '${date_init.day.toString().padLeft(2, '0')}/${date_init.month.toString().padLeft(2, '0')}/${date_init.year}',
                  style: const TextStyle(fontSize: 11),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: _showDateInitPicker,
                  child: const Icon(
                    Icons.calendar_today,
                    size: 20.0,
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
                child: Text(
                    '${time_init.hour.toString().padLeft(2, '0')}:${time_init.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 11)),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: _showTimeInitPicker,
                  child: const Icon(Icons.lock_clock,
                      size: 20.0, semanticLabel: 'Definir Início'),
                ),
              )
            ],
          ),
          const Row(
            children: <Widget>[
              Expanded(
                child: Text('Final', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Spacer(flex: 1),
              Expanded(
                flex: 2,
                child: Text(
                    '${date_end.day.toString().padLeft(2, '0')}/${date_end.month}/${date_end.year}',
                    style: const TextStyle(fontSize: 11)),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: _showDateEndPicker,
                  child: const Icon(Icons.calendar_today,
                      size: 20.0, semanticLabel: 'Definir Final'),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              const Spacer(flex: 1),
              Expanded(
                flex: 2,
                child: Text(
                    '${time_end.hour.toString().padLeft(2, '0')}:${time_end.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 11)),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: _showTimeEndPicker,
                  child: const Icon(Icons.lock_clock,
                      size: 20.0, semanticLabel: 'Definir Horário final'),
                ),
              ),
            ],
          ),
          TextFormField(
            initialValue: formData['subject']?.toString(),
            style: const TextStyle(fontSize: 11),
            decoration: const InputDecoration(
                labelText: 'Assunto', labelStyle: TextStyle(fontSize: 12)),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onChanged: (subject) => formData['subject'] = subject ?? '',
            onSaved: (subject) => formData['subject'] = subject ?? '',
            validator: (_subject) {
              final subject = _subject ?? '';

              if (subject.trim().isEmpty) {
                return 'Obrigatório';
              }

              return null;
            },
          ),
        ]),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar', style: const TextStyle(fontSize: 12)),
        ),
        TextButton(
          onPressed: submitClone,
          child: Text('Clonar', style: const TextStyle(fontSize: 12)),
        ),
      ],
    );
  }
}
