import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  final String pageTitle;
  @override
  final Size preferredSize;
  AppBarCustom({required this.pageTitle})
      : preferredSize = Size.fromHeight(60.0);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.pageTitle),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: Image.asset(
            "assets/images/logo_ga.png",
            width: 32,
            height: 32,
          ),
        ),
      ],
    );
  }
}
