import 'package:flutter/material.dart';
import 'package:go2beach/Pages/widgets/home.dart';
import 'package:go2beach/Pages/widgets/prenotabar.dart';

class Lido extends StatefulWidget {
  const Lido({super.key});
  @override
  State<StatefulWidget> createState() => _Lido();
}

class _Lido extends State<Lido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 47, right: 30, top: 10, bottom: 50),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "  ${Home.getLido()}",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Divider(
                      color: const Color.fromARGB(255, 131, 198, 230),
                    ),
                    Text(
                      "      Scegli cosa vuoi prenotare",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10,
                color: const Color.fromARGB(255, 131, 198, 230),
              ),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage(
                            "assets/images/attrezzature-balneari.jpg"),
                        height: 150,
                        width: 320,
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
              Divider(
                height: 50,
                color: const Color.fromARGB(255, 131, 198, 230),
              ),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PrenotaBar()));
                  },
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage("assets/images/bar.jpg"),
                        height: 150,
                        width: 320,
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
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 131, 198, 230),
    );
  }
}
