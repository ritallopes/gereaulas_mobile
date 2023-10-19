import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/data/dummy.dart';
import 'package:gereaulas_mobile/models/domain/user.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final Function(User) onSubmitLogin;

  LoginPage(this.onSubmitLogin);

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
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);

    _submitLogin() {
      final email = _emailController.text;
      final password = _passwordController.text;
      for (var user in DUMMY_USERS) {
        print(email == user.email);
        print(password == user.password);
        if (email == user.email && password == user.password) {
          userStore.setEmail(email);
          userStore.setPassword(password);
          widget.onSubmitLogin(user);
          Navigator.of(context).pushReplacementNamed(Routes.MAIN_PAGE);
          return;
        }
      }
      setState(() {
        _error = 'Email ou senha incorreto!';
      });
      _emailController.clear();
      _passwordController.clear();
    }

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
                    builder: (_) => userStore.isAuthenticated
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
