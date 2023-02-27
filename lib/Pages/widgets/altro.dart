import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go2beach/Pages/homepage.dart';
import 'package:go2beach/Pages/login_page.dart';
import 'package:go2beach/Pages/welcome_page.dart';
import 'package:go2beach/Pages/widgets/info.dart';
import 'package:go2beach/Pages/widgets/privacy.dart';

class Altro extends StatefulWidget {
  const Altro({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Altro();
}

class _Altro extends State<Altro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 55, top: 60, bottom: 30),
      child: Scaffold(
        body: Container(
          child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 2.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Container(
                padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                width: 300,
                child: Column(children: [
                  const Divider(),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Privacy(),
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Informazioni Legali",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 20),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Info()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Informazioni sull' App",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 310,
                  ),
                  Row(
                    children: [
                      Icon(Icons.logout),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 83),
                          child: Text(
                            'ESCI',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                backgroundColor: Colors.red),
                          ),
                        ),
                        onPressed: () {
                          _signOut();
                          Navigator.of(context).pop(MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        },
                      ),
                    ],
                  ),
                ]),
              )),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}
