import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gereaulas_mobile/components/circular_progress.dart';
import 'package:gereaulas_mobile/components/header_home.dart';
import 'package:gereaulas_mobile/models/stores/user.store.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';
import 'package:gereaulas_mobile/utils/queries/user.dart';
import 'package:gereaulas_mobile/utils/theme/theme_app.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserStore userStore;
  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: HeaderHome(teacher: getUserTeacher(userStore.email)),
                ),
                const Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(children: [
                    Expanded(flex: 3, child: SizedBox()),
                    Expanded(flex: 2, child: CircularProgress()),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Observer(
                            builder: (_) => const Text(
                              'Organize suas aulas',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                          child: Text(
                            "O GereAulas te ajuda a organizar suas aulas",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(Routes.CLASS_PAGE);
                              },
                              child: const Text("Aulas de hoje")),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
