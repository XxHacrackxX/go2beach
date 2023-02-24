import 'package:flutter/material.dart';

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
                    onPressed: () {},
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
                    onPressed: () {},
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
                ]),
              )),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
