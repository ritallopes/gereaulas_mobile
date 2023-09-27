import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            value: 0.7,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Você já lencionou ${4}/${5} aulas",
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
