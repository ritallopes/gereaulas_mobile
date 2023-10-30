import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late UserStore userStore;
  String _error = '';
  @override
  void initState() {
    super.initState();
    _error = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userStore = Provider.of<UserStore>(context);
    autorun((p0) => {
          if (userStore.isAuthenticated)
            {Navigator.of(context).pushReplacementNamed(Routes.MAIN_PAGE)}
        });
  }

  _submitLogin() {
    userStore.login(userStore.email, userStore.password).then((loginSuccess) {
      _emailController.clear();
      _passwordController.clear();
      if (loginSuccess) {
        setState(() {
          _error = '';
        });
      } else {
        setState(() {
          _error = 'Email ou senha incorreto!';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    "assets/images/logo_ga.png",
                    fit: BoxFit.fitWidth,
                    width: 100,
                    height: 100,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                        visible: _error != '',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.error,
                                color: Colors.pink,
                                size: 24.0,
                                semanticLabel: 'Email ou senha errado'),
                            Text(_error,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.error)),
                          ],
                        )),
                  ),
                  TextField(
                    controller: _emailController,
                    onChanged: (value) => userStore.setEmail(value),
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    autofocus: true,
                    controller: _passwordController,
                    onChanged: (value) => userStore.setPassword(value),
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Observer(
                    builder: (_) => userStore.isFieldLoginFilled
                        ? Padding(
                            padding: const EdgeInsets.all(30),
                            child: ElevatedButton(
                                onPressed: _submitLogin,
                                child: const Text("Entrar")),
                          )
                        : const Padding(
                            padding: EdgeInsets.all(30),
                            child: ElevatedButton(
                                onPressed: null, child: const Text("Entrar")),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.REGISTER_PAGE);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Não tem conta? Cadastre-se!",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
