import 'package:flutter/material.dart';

class MenuNavigationBar extends StatefulWidget {
  Function(int index) onSelectIndex;
  int _selectedIndex;

  MenuNavigationBar(this._selectedIndex, this.onSelectIndex);

  @override
  State<MenuNavigationBar> createState() => _MenuNavigationBarState();
}

class _MenuNavigationBarState extends State<MenuNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  void _onTap(int index) {
    if (index == 3) {
      showModal(context);
    } else {
      setState(
        () {
          widget.onSelectIndex(index);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.black54),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Aulas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Alunos',
          ),
        ],
        currentIndex: widget._selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: _onTap);
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Perfil'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Fechar'),
          )
        ],
      ),
    );
  }
}
