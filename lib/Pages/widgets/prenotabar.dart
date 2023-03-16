import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:go2beach/Pages/widgets/home.dart';
import 'package:go2beach/Pages/widgets/lido.dart';
import 'package:go2beach/Pages/widgets/sign_in.dart';
import 'dart:math';

class PrenotaBar extends StatefulWidget {
  const PrenotaBar({super.key});
  @override
  State<StatefulWidget> createState() => _PrenotaBar();
}

int counterCocaCola = 0,
    counterEstathe = 0,
    counterSpritz = 0,
    counterAcqua = 0,
    counterFanta = 0;

String? nomeLido = Home.getLido();
String id = getRandomString(10);
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
updateBar() async {
  String? Email = SignIn.getEmail();
  String? nomeLido = Home.getLido();
  final barRef = await FirebaseFirestore.instance
      .collection('$nomeLido')
      .doc('Bar')
      .update({
    'Cocacola': FieldValue.increment(-counterCocaCola),
    'Acqua': FieldValue.increment(-counterAcqua),
    'Estathe': FieldValue.increment(-counterEstathe),
    'Fanta': FieldValue.increment(-counterFanta),
    'Spritz': FieldValue.increment(-counterSpritz)
  });
  final PrenotaBarRef = await FirebaseFirestore.instance
      .collection('PrenotazioneBar')
      .doc(id)
      .set({
    "Email": Email,
    "Lido": nomeLido,
    "Cocacola": counterCocaCola,
    "Acqua": counterAcqua,
    "Fanta": counterFanta,
    "Spritz": counterSpritz,
    "Estathe": counterEstathe,
    "Data": DateTime.now(),
    "Id": id,
  });
  counterCocaCola = 0;
  counterEstathe = 0;
  counterSpritz = 0;
  counterAcqua = 0;
  counterFanta = 0;
}

class _PrenotaBar extends State<PrenotaBar> {
  @override
  void initState() {
    setState(() {
      getBevande();
    });
    super.initState();
  }

  getBevande() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('$nomeLido')
        .doc('Bar')
        .get();
    counters = snapshot.data()!;
    print(counters);
  }

  @override
  void dispose() {
    counterCocaCola = 0;
    counterEstathe = 0;
    counterSpritz = 0;
    counterAcqua = 0;
    counterFanta = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(left: 47, right: 30, top: 10, bottom: 50),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Column(
                children: [
                  Text(
                    "Componi il tuo ordine",
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
                          'assets/images/cocacola.jpg',
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 6
                              : MediaQuery.of(context).size.height,
                          width: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 2.5
                              : MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CustomizableCounter(
                          maxCount: Lido.getMaxCountCocacola()!,
                          borderWidth: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 280
                              : MediaQuery.of(context).size.width / 36,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: double.parse(MediaQuery.of(context)
                                  .size
                                  .width
                                  .toString()) /
                              32,
                          onCountChange: (count) {},
                          onIncrement: (count) {
                            setState(() {
                              counterCocaCola = counterCocaCola + 1;
                            });
                          },
                          onDecrement: (count) {
                            setState(() {
                              counterCocaCola = counterCocaCola - 1;
                            });
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
                          'assets/images/estathè.jpg',
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 6
                              : MediaQuery.of(context).size.height,
                          width: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 2.5
                              : MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CustomizableCounter(
                          maxCount: Lido.getMaxCountEstathe()!,
                          borderWidth: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 280
                              : MediaQuery.of(context).size.width / 36,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: double.parse(MediaQuery.of(context)
                                  .size
                                  .width
                                  .toString()) /
                              32,
                          onCountChange: (count) {},
                          onIncrement: (count) {
                            setState(() {
                              counterEstathe = counterEstathe + 1;
                            });
                          },
                          onDecrement: (count) {
                            setState(() {
                              counterEstathe = counterEstathe - 1;
                            });
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
                          'assets/images/Koto_CaseStudy_Fanta_003-1_1921cae71.jpg',
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 6
                              : MediaQuery.of(context).size.height,
                          width: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 2.5
                              : MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CustomizableCounter(
                          maxCount: Lido.getMaxCountFanta()!,
                          borderWidth: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 280
                              : MediaQuery.of(context).size.width / 36,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: double.parse(MediaQuery.of(context)
                                  .size
                                  .width
                                  .toString()) /
                              32,
                          onCountChange: (count) {},
                          onIncrement: (count) {
                            setState(() {
                              counterFanta = counterFanta + 1;
                            });
                          },
                          onDecrement: (count) {
                            setState(() {
                              counterFanta = counterFanta - 1;
                            });
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
                          'assets/images/San_Benedetto_Standard.jpg',
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 6
                              : MediaQuery.of(context).size.height,
                          width: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 2.5
                              : MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CustomizableCounter(
                          maxCount: Lido.getMaxCountAcqua()!,
                          borderWidth: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 280
                              : MediaQuery.of(context).size.width / 36,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: double.parse(MediaQuery.of(context)
                                  .size
                                  .width
                                  .toString()) /
                              32,
                          onCountChange: (count) {},
                          onIncrement: (count) {
                            setState(() {
                              counterAcqua = counterAcqua + 1;
                            });
                          },
                          onDecrement: (count) {
                            setState(() {
                              counterAcqua = counterAcqua - 1;
                            });
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
                          'assets/images/aperol.jpg',
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 6
                              : MediaQuery.of(context).size.height,
                          width: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 2.5
                              : MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CustomizableCounter(
                          maxCount: Lido.getMaxCountSpritz()!,
                          borderWidth: currenWidth < 600
                              ? MediaQuery.of(context).size.width / 280
                              : MediaQuery.of(context).size.width / 36,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: double.parse(MediaQuery.of(context)
                                  .size
                                  .width
                                  .toString()) /
                              32,
                          onCountChange: (count) {},
                          onIncrement: (count) {
                            setState(() {
                              counterSpritz = counterSpritz + 1;
                            });
                          },
                          onDecrement: (count) {
                            setState(() {
                              counterSpritz = counterSpritz - 1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 50,
                    color: const Color.fromARGB(255, 131, 198, 230),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                        onPressed: () {
                          updateBar();
                          customAlertDialogConSuccesso(context);
                        },
                        icon: Icon(Icons.shopping_cart_checkout),
                        label: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Completa l'ordine",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 131, 198, 230),
    );
  }

  static void customAlertDialogConSuccesso(BuildContext context) {
    Widget okButton = ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    var dialog = AlertDialog(
      title: const Text("Ordine effettuato con successo"),
      content: const Text("Ordine ricevuto!"),
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
}
