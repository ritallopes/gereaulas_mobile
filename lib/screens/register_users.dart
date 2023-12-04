import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/components/image_upload.dart';
import 'package:gereaulas_mobile/components/register_student.dart';
import 'package:gereaulas_mobile/controllers/teacher_controller.dart';
import 'package:gereaulas_mobile/controllers/user_controller.dart';
import 'package:gereaulas_mobile/database/users_db.dart';
import 'package:gereaulas_mobile/models/stores/teacher.store.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final _nameFocus = FocusNode();
  final _imageFocus = FocusNode();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  UserType? _selectedUserType;

  @override
  void initState() {
    super.initState();
  }

  File? _pickedImage;

  void _selectImage(File? pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitRegister() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }
    _formKey.currentState?.save();

    String type = _selectedUserType.toString() ?? UserType.NOTYPE.toString();
    String email = _formData['email'].toString();
    String password = _formData['password'].toString();
    String name = _formData['name'].toString();
    String image_profile = '';

    UserDb()
        .saveImageToAppDirectory(_pickedImage, name)
        .then((value) => image_profile = value);

    UserController.saveUser(email, password, type.toUpperCase());
    if (_selectedUserType == UserType.TEACHER) {
      Future<TeacherStore?> t =
          TeacherController.saveTeacher(name, email, image_profile);
      print(t.toString());
    }
    Navigator.of(context).pushNamed(
      Routes.LOGIN_PAGE,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuário'),
        actions: [Image.asset("assets/images/logo_ga.png")],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formData['name']?.toString(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
                focusNode: _nameFocus,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocus);
                },
                onSaved: (name) => _formData['name'] = name ?? '',
                validator: (_name) {
                  final name = _name ?? '';

                  if (name.trim().isEmpty) {
                    return 'Nome é obrigatório';
                  }

                  if (name.trim().length < 3) {
                    return 'Nome precisa no mínimo de 3 letras.';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: _formData['email']?.toString(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                focusNode: _emailFocus,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
                onSaved: (email) => _formData['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';

                  if (email.trim().isEmpty) {
                    return 'Email é obrigatório';
                  }

                  if (email.trim().length < 3) {
                    return 'Email precisa no mínimo de 3 letras.';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
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
              ImageUpload(_selectImage),
              const SizedBox(
                height: 20,
              ),
              const Text('Tipo de usuário'),
              Column(
                children: [
                  RadioListTile<UserType>(
                    title: const Text(
                      'Professor',
                      style: TextStyle(fontSize: 16),
                    ),
                    value: UserType.TEACHER,
                    groupValue: _selectedUserType,
                    onChanged: (UserType? value) {
                      setState(() {
                        _selectedUserType = value;
                      });
                    },
                  ),
                  RadioListTile<UserType>(
                    title: const Text(
                      'Estudante',
                      style: TextStyle(fontSize: 16),
                    ),
                    value: UserType.STUDENT,
                    groupValue: _selectedUserType,
                    onChanged: (UserType? value) {
                      setState(() {
                        _selectedUserType = value;
                      });
                    },
                  ),
                  RadioListTile<UserType>(
                    title: const Text(
                      'Responsável',
                      style: TextStyle(fontSize: 16),
                    ),
                    value: UserType.RESPONSIBLE,
                    groupValue: _selectedUserType,
                    onChanged: (UserType? value) {
                      setState(() {
                        _selectedUserType = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  child: _selectedUserType == UserType.STUDENT
                      ? RegisterStudentFields()
                      : null),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                    onPressed: _submitRegister, child: const Text("Cadastrar")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
