import 'package:flutter/material.dart';
import 'package:go2beach/Pages/welcome_page.dart';
import 'package:go2beach/Pages/widgets/altro.dart';
import 'package:go2beach/Pages/widgets/lido.dart';
import 'package:go2beach/Pages/widgets/prenotazioni.dart';
import 'package:go2beach/app.dart';
import 'package:go2beach/Pages/widgets/sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 55, right: 20, top: 50, bottom: 50),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: Text(
                  "BENTORNATO, ${SignIn.getEmail()}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Lido()));
                  },
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage("assets/images/selvetta.png"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Lido()));
                  },
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage("assets/images/sirenetta.jpg"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Lido()));
                  },
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage("assets/images/baracchino.jpg"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Lido()));
                  },
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage("assets/images/verde.jpg"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Lido()));
                  },
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage("assets/images/ondeblu.jpg"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
