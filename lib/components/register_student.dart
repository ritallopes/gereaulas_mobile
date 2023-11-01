import 'package:flutter/material.dart';

class RegisterStudentFields extends StatefulWidget {
  const RegisterStudentFields();
  @override
  State<RegisterStudentFields> createState() => _RegisterStudentFieldsState();
}

class _RegisterStudentFieldsState extends State<RegisterStudentFields> {
  final _formData = Map<String, Object>();
    final _passwordFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: _formData['password']?.toString(),
          focusNode: _passwordFocus,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Senha',
          ),
          textInputAction: TextInputAction.next,
          obscureText: true,
          onSaved: (password) => _formData['password'] = password ?? '',
          validator: (_password) {
            final password = _password ?? '';

            if (password.trim().isEmpty) {
              return 'Senha é obrigatório';
            }

            if (password.trim().length < 3) {
              return 'Senha precisa no mínimo de 3 letras.';
            }

            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
