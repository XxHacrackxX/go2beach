import 'package:flutter/material.dart';
import 'package:go2beach/Pages/widgets/home.dart';
import 'package:go2beach/Pages/widgets/prenotabar.dart';
import 'package:go2beach/Pages/widgets/prenotalido.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

double maxCounterAcqua = double.parse(counters['Acqua'].toString());
double maxCounterCocaCola = double.parse(counters['Cocacola'].toString());
double maxCounterEstathe = double.parse(counters['Estathe'].toString());
double maxCounterFanta = double.parse(counters['Fanta'].toString());
double maxCounterSpritz = double.parse(counters['Spritz'].toString());
double maxCounterLettini = double.parse(contatori['Lettino'].toString());
double maxCounterSedie = double.parse(contatori['Sedie'].toString());

class Lido extends StatefulWidget {
  const Lido({super.key});
  @override
  State<StatefulWidget> createState() => _Lido();
  static double getMaxCountCocacola() {
    return maxCounterCocaCola;
  }

  static double getMaxCountAcqua() {
    return maxCounterAcqua;
  }

  static double getMaxCountEstathe() {
    return maxCounterEstathe;
  }

  static double getMaxCountFanta() {
    return maxCounterFanta;
  }

  static double getMaxCountSpritz() {
    return maxCounterSpritz;
  }

  static double getMaxCountLettini() {
    return maxCounterLettini;
  }

  static double getMaxCountSedie() {
    return maxCounterSedie;
  }
}

getBevande() async {
  final snapshot =
      await FirebaseFirestore.instance.collection('$nomeLido').doc('Bar').get();
  counters = snapshot.data()!;
  print(counters);
}

getLettinoSedie() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('$nomeLido')
      .doc('LettinoSedie')
      .get();
  contatori = snapshot.data()!;
  print(contatori);
}

class _Lido extends State<Lido> {
  @override
  void initState() {
    setState(() {
      getBevande();
      getLettinoSedie();
    });
    super.initState();
  }

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
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PrenotaLido()));
                  },
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
