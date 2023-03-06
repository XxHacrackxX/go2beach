import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go2beach/Pages/widgets/sign_in.dart';

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
                    Text(
                      " Bar Lido ${users.map((user) => user['Lido']).toString().replaceAll((r"("), '').replaceAll((r")"), '')}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " Data: ${users.map((user) => user['Data'].toDate()).toString().replaceAll((r"("), '').replaceAll((r")"), '')}\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "  Cocacola: ${users.map((user) => user['Cocacola']).toString().replaceAll((r"("), '').replaceAll((r")"), '')}, Acqua: ${users.map((user) => user['Acqua']).toString().replaceAll((r"("), '').replaceAll((r")"), '')}, Estathè: ${users.map((user) => user['Estathe']).toString().replaceAll((r"("), '').replaceAll((r")"), '')}, Fanta: ${users.map((user) => user['Fanta']).toString().replaceAll((r"("), '').replaceAll((r")"), '')}, Spritz: ${users.map((user) => user['Spritz']).toString().replaceAll((r"("), '').replaceAll((r")"), '')} ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}
