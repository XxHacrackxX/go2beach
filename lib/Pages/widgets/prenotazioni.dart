import 'package:flutter/material.dart';

class Prenotazioni extends StatelessWidget {
  const Prenotazioni({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "Prenotazioni",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
