import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/controllers/user_controller.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();
  }

  void _submitRegister() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }
    _formKey.currentState?.save();

    String type = _formData['type'].toString();
    String email = _formData['email'].toString();
    String password = _formData['password'].toString();

    UserController.createUser(email, password, type.toUpperCase());

    Navigator.of(context).pushNamed(
      Routes.LOGIN_PAGE,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
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
              TextFormField(
                initialValue: _formData['type']?.toString(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tipo de usuário',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocus);
                },
                onSaved: (type) => _formData['type'] = type ?? '',
                validator: (_type) {
                  final type = _type ?? '';

                  if (type.trim().isEmpty) {
                    return 'Tipo é obrigatório';
                  }

                  return null;
                },
              ),
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
