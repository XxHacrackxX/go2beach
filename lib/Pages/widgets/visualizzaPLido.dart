import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go2beach/Pages/widgets/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final usersRef = FirebaseFirestore.instance.collection('PrenotazioneLido');

class visualizzaPLido extends StatefulWidget {
  const visualizzaPLido({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _visualizzaPLido();
}

class _visualizzaPLido extends State<visualizzaPLido> {
  List<dynamic> users = [];
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() async {
    final snapshot = await usersRef
        .where("Email", isEqualTo: SignIn.getEmail())
        .where("Data",
            isLessThan: DateTime.now()) //Modificare con Equal SOLO alla Data
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
    var lettini = users.map((user) => user['Lettini']).toList(growable: false);
    var sedie = users.map((user) => user['Sedie']).toList(growable: false);
    var X = users.map((user) => user['X']).toList(growable: false);
    var Y = users.map((user) => user['Y']).toList(growable: false);
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
                " Lido ${lido[i]}",
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
            " Lettini: ${lettini[i]}, Sedie: ${sedie[i]}, Posizione: ${X[i]},${Y[i]} ",
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
