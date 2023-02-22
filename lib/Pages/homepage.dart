import 'package:flutter/widgets.dart';
import 'package:go2beach/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(64),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          CustomTheme.gradientStart,
          CustomTheme.gradientEnd,
        ], begin: FractionalOffset(0.0, 0.0), end: FractionalOffset(1.0, 1.0))),
      ),
    );
  }
}
