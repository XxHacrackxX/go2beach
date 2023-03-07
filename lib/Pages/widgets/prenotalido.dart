import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:go2beach/Pages/widgets/home.dart';
import 'package:go2beach/Pages/widgets/lido.dart';
import 'package:go2beach/Pages/widgets/sign_in.dart';

class PrenotaLido extends StatefulWidget {
  const PrenotaLido({super.key});
  @override
  State<StatefulWidget> createState() => _PrenotaLido();
}

class _PrenotaLido extends State<PrenotaLido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      body: Padding(
          padding: EdgeInsets.only(left: 47, right: 30, top: 10, bottom: 50),
          child: SingleChildScrollView(
              child: Wrap(children: [
            Column(children: [
              Text(
                "Scegli le attrezzature e la posizione",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 40,
                color: const Color.fromARGB(255, 131, 198, 230),
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/lettino-spiaggia-alluminio-professional.jpg',
                      height: 120.0,
                      width: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: CustomizableCounter(
                      borderWidth: 5,
                      borderRadius: 100,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      textSize: 22,
                      onCountChange: (count) {},
                      onIncrement: (count) {
                        setState(() {});
                      },
                      onDecrement: (count) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
                color: const Color.fromARGB(255, 131, 198, 230),
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/ebaydb01b29.jpg',
                      height: 120.0,
                      width: 160,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: CustomizableCounter(
                      borderWidth: 5,
                      borderRadius: 100,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      textSize: 22,
                      onCountChange: (count) {},
                      onIncrement: (count) {
                        setState(() {});
                      },
                      onDecrement: (count) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              //
              Divider(
                height: 40,
                color: const Color.fromARGB(255, 131, 198, 230),
              ),
              Text(
                "Scegli la posizione dell'ombrellone",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                  height: 20, color: const Color.fromARGB(255, 131, 198, 230)),
              for (int i = 0; i < 5; i++) Griglia(i),
              Divider(
                height: 40,
                color: const Color.fromARGB(255, 131, 198, 230),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_checkout),
                    label: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Completa la prenotazione",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ])
          ]))),
      backgroundColor: const Color.fromARGB(255, 131, 198, 230),
    );
  }
}

Widget Griglia(int i) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.fill, image: AssetImage("assets/images/sabbia.jpg")),
    ),
    child: Wrap(
      children: [
        for (int i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.all(9),
            child: IconButton(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
              icon: Icon(Icons.square),
              onPressed: () {},
            ),
          ),
      ],
    ),
  );
}
