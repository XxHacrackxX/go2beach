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
    int? count = lido.length;
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
          Text(
            " Data: ${data[i]}\n",
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
}
