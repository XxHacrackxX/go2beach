import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:go2beach/Pages/widgets/home.dart';
import 'package:go2beach/Pages/widgets/lido.dart';
import 'package:go2beach/Pages/widgets/prenotabar.dart';
import 'package:go2beach/Pages/widgets/sign_in.dart';

int counterSedie = 0;
int counterLettino = 0;
bool disponibile = true;
int? X;
int? Y;
updateLido() async {
  String? Email = SignIn.getEmail();
  String? nomeLido = Home.getLido();
  final lidoRef = await FirebaseFirestore.instance
      .collection('$nomeLido')
      .doc('LettinoSedie')
      .update({
    'Lettino': FieldValue.increment(-counterLettino),
    'Sedie': FieldValue.increment(-counterSedie)
  });
  final prenotaLido =
      await FirebaseFirestore.instance.collection('Prenotazioni').add({
    "Email": Email,
    "Lido": nomeLido,
    "Lettini": counterLettino,
    "Sedie": counterSedie,
    "X": X,
    "Y": Y,
    "Data": DateTime.now()
  });
  counterLettino = 0;
  counterSedie = 0;
  final eliminaLido = await FirebaseFirestore.instance
      .collection('$nomeLido')
      .doc("$X$Y")
      .update({"Disponibile": false});
}

class PrenotaLido extends StatefulWidget {
  const PrenotaLido({super.key});
  @override
  State<StatefulWidget> createState() => _PrenotaLido();
}

class _PrenotaLido extends State<PrenotaLido> {
  int i = 0, j = 0, z = 0;
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
              child: Wrap(children: [
            Column(children: [
              const Text(
                "Scegli le attrezzature e la posizione",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(
                height: 40,
                color: Color.fromARGB(255, 131, 198, 230),
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
                        setState(() {
                          counterLettino++;
                        });
                      },
                      onDecrement: (count) {
                        setState(() {
                          counterLettino--;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                color: Color.fromARGB(255, 131, 198, 230),
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
                        setState(() {
                          counterSedie++;
                        });
                      },
                      onDecrement: (count) {
                        setState(() {
                          counterSedie--;
                        });
                      },
                    ),
                  ),
                ],
              ),
              //
              const Divider(
                height: 40,
                color: Color.fromARGB(255, 131, 198, 230),
              ),
              const Text(
                "Scegli la posizione dell'ombrellone",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(
                  height: 20, color: Color.fromARGB(255, 131, 198, 230)),
              for (i = 0; i < 5; i++)
                Row(children: [
                  for (j = 0; j < 5; j++) Griglia(i, j),
                ]),
              const Divider(
                height: 40,
                color: Color.fromARGB(255, 131, 198, 230),
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
                    onPressed: () {
                      updateLido();
                      customAlertDialogConSuccesso(context);
                    },
                    icon: const Icon(Icons.shopping_cart_checkout),
                    label: const Padding(
                      padding: EdgeInsets.all(20),
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

  static void customAlertDialogConXY(BuildContext context) {
    Widget okButton = ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    var dialog = AlertDialog(
      title: Text("Hai scelto l'ombrellone $X,$Y"),
      content: const Text("Conferma scelta!"),
      actions: [
        okButton,
      ],
      shape: RoundedRectangleBorder(
          side: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      backgroundColor: Colors.white,
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  static void customAlertDialogConSuccesso(BuildContext context) {
    Widget okButton = ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    var dialog = AlertDialog(
      title: const Text("Prenotazione effettuata con successo"),
      content: const Text("Prenotazione ricevuta!"),
      actions: [
        okButton,
      ],
      shape: RoundedRectangleBorder(
          side: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      backgroundColor: Colors.white,
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  void settaggioGriglia(int i, int j) {
    X = i;
    Y = j;
    disponibile = !disponibile;
  }

  Widget Griglia(int i, int j) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage("assets/images/sabbia.jpg")),
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(9),
            child: IconButton(
              padding: const EdgeInsets.fromLTRB(2, 1, 2, 1),
              icon: const Icon(Icons.check_box_outline_blank),
              onPressed: () {
                settaggioGriglia(i, j);
                customAlertDialogConXY(context);
                print("$i,$j");
              },
            ),
          ),
        ],
      ),
    );
  }
}
