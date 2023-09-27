import 'package:flutter/material.dart';
import 'package:gereaulas_mobile/components/menu_bar.dart';
import 'package:gereaulas_mobile/models/user.dart';
import 'package:gereaulas_mobile/screens/class_page.dart';
import 'package:gereaulas_mobile/screens/home_page.dart';
import 'package:gereaulas_mobile/screens/student_page.dart';

class MainScreen extends StatefulWidget {
  late User _user;

  MainScreen(this._user);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> pages;
  int _selectedIndex = 0;
  @override
  void initState() {
    pages = [HomePage(widget._user), ClassPage(widget._user), StudentPage(widget._user)];
    super.initState();
  }

  void selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: MenuNavigationBar(_selectedIndex, selectIndex),
    );
  }
}
