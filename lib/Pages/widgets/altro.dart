import 'package:flutter/material.dart';

class Altro extends StatelessWidget {
  const Altro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "ALTRO",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
