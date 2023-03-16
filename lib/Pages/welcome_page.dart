import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:go2beach/Pages/login_page.dart';
import 'package:go2beach/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(64),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          CustomTheme.gradientStart,
          CustomTheme.gradientEnd,
        ], begin: FractionalOffset(0.0, 0.0), end: FractionalOffset(1.0, 1.0))),
        child: Column(
          children: [
            _welcomeWidget(),
            _signInButton(context),
          ],
        ),
      ),
    );
  }
}

Widget _welcomeWidget() {
  return Expanded(
    child: SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Image(
          image: AssetImage('assets/images/undraw_Beach_day_cser.png'),
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "go2Beach",
            style: TextStyle(
                fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ]),
    ),
  );
}

Widget _signInButton(BuildContext context) {
  return ElevatedButton(
    child: const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 58),
      child: const Text(
        "INIZIA",
        style: TextStyle(fontSize: 25),
      ),
    ),
    onPressed: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage())),
  );
}
