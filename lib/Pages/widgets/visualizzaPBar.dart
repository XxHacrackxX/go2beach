import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go2beach/Pages/widgets/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final usersRef = FirebaseFirestore.instance.collection('PrenotazioneBar');

class visualizzaPBar extends StatefulWidget {
  const visualizzaPBar({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _visualizzaPBar();
}

class _visualizzaPBar extends State<visualizzaPBar> {
  List<dynamic> users = [];
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() async {
    final snapshot = await usersRef
        .where("Email", isEqualTo: SignIn.getEmail())
        .where("Data", isLessThan: DateTime.now())
        .get();
    setState(() {
      users = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    var lido = users.map((user) => user['Lido']).toList(growable: false);
    var data =
        users.map((user) => user['Data'].toDate()).toList(growable: false);
    var cocacola =
        users.map((user) => user['Cocacola']).toList(growable: false);
    var acqua = users.map((user) => user['Acqua']).toList(growable: false);
    var spritz = users.map((user) => user['Spritz']).toList(growable: false);
    var fanta = users.map((user) => user['Fanta']).toList(growable: false);
    var estathe = users.map((user) => user['Estathe']).toList(growable: false);
    var id = users.map((user) => user['Id']).toList(growable: false);
    int? count = lido.length;
    var _numberToMonthMap = {
      01: "Gennaio",
      02: "Febbraio",
      03: "Marzo",
      04: "Aprile",
      05: "Maggio",
      06: "Giugno",
      07: "Luglio",
      08: "Agosto",
      09: "Settembre",
      10: "Ottobre",
      11: "Novembre",
      12: "Dicembre"
    };
    var _numberToMinuteMap = {
      0: "00",
      1: "01",
      2: "02",
      3: "03",
      4: "04",
      5: "05",
      6: "06",
      7: "07",
      8: "08",
      9: "09",
      10: "10",
      11: "11",
      12: "12",
      13: "13",
      14: "14",
      15: "15",
      16: "16",
      17: "17",
      18: "18",
      19: "19",
      20: "20",
      21: "21",
      22: "22",
      23: "23",
      24: "24",
      25: "25",
      26: "26",
      27: "27",
      28: "28",
      29: "29",
      30: "30",
      31: "31",
      32: "32",
      33: "33",
      34: "34",
      35: "35",
      36: "36",
      37: "37",
      38: "38",
      39: "39",
      40: "40",
      41: "41",
      42: "42",
      43: "43",
      44: "44",
      45: "45",
      46: "46",
      47: "47",
      48: "48",
      49: "49",
      50: "50",
      51: "51",
      52: "52",
      53: "53",
      54: "54",
      55: "55",
      56: "56",
      57: "57",
      58: "58",
      59: "59",
    };
    Widget Prenotazione(int i) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 20,
          ),
          Row(
            children: [
              Text(
                " Bar Lido ${lido[i]}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    usersRef.doc("${id[i]}").delete().then(
                          (doc) => customAlertDialogEliminazione(context),
                          onError: (e) => print("Error updating document $e"),
                        );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
          Text(
            " Data: ${data[i].day} ${_numberToMonthMap[data[i].month]} ${data[i].year}  Ora: ${data[i].hour} : ${_numberToMinuteMap[data[i].minute]}\n",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " Cocacola: ${cocacola[i]}, Acqua: ${acqua[i]}, Estathè: ${estathe[i]}, Fanta: ${fanta[i]}, Spritz: ${spritz[i]} ",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          Divider(
            height: 20,
          )
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 16),
      child: SingleChildScrollView(
        child: Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 24),
              width: 300,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < count; i++) Prenotazione(i),
                  ]),
            )),
      ),
    );
  }

  void customAlertDialogEliminazione(BuildContext context) {
    Widget okButton = ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    var dialog = AlertDialog(
      title: Text("Prenotazione Eliminata con Successo!"),
      content: const Text("Clicca Ok per continuare."),
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
