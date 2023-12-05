import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/stores/student.store.dart';

class StudentDropdown extends StatelessWidget {
  final List<StudentStore> students;
  final StudentStore? selectedStudent;
  final ValueChanged<StudentStore?> onChanged;

  const StudentDropdown({
    required this.students,
    required this.selectedStudent,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedStudent,
      hint: Text(selectedStudent?.name ?? "Selecione o estudante"),
      items: students
          .map((e) => DropdownMenuItem(
                child: Text(e.name.toString()),
                value: e,
              ))
          .toList(),
      onChanged: onChanged,
      validator: (selectedStudent) {
        if (selectedStudent == null) {
          return 'Obrigatório';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Estudante',
      ),
    );
  }
}
