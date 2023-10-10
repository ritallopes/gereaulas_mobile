import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/user.dart';
import 'package:intl/intl.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';

class AddClassPage extends StatefulWidget {
  final User _user;
  const AddClassPage(this._user);

  @override
  State<AddClassPage> createState() => _AddClassPageState();
}

class _AddClassPageState extends State<AddClassPage> {
  DateTime date_init = DateTime.now();
  DateTime date_end = DateTime.now();

  TimeOfDay time_init = TimeOfDay.now();
  TimeOfDay time_end = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(title: Text("Marcar aula")),
      drawer: const AddClassDrawer(),
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
                  child: Text('Inicio'),
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
                    onPressed: _showDateEndPicker,
                    child: const Icon(Icons.calendar_today,
                        size: 24.0, semanticLabel: 'Definir Inicio'),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                const Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: Text('${time_init.hour}/${time_init.minute}'),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: _showTimeInitPicker,
                    child: const Icon(Icons.lock_clock,
                        size: 24.0, semanticLabel: 'Definir Inicio'),
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
                  child: Text('${time_end.hour}/${time_end.minute}'),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: _showTimeInitPicker,
                    child: const Icon(Icons.lock_clock,
                        size: 24.0, semanticLabel: 'Definir Horario final'),
                  ),
                )
              ],
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
            )
          ],
        ),
      ),
    );
  }
}

class AddClassDrawer extends StatelessWidget {
  const AddClassDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/imgs/background.png",
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Text(
              "Marque uma nova aula",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.MAIN_PAGE);
            },
          ),
          ListTile(
            title: const Text('Aulas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.CLASS_PAGE);
            },
          )
        ],
      ),
    );
    ;
  }
}
