import 'package:flutter/material.dart';
import 'package:go2beach/Pages/welcome_page.dart';
import 'package:go2beach/Pages/widgets/altro.dart';
import 'package:go2beach/Pages/widgets/lido.dart';
import 'package:go2beach/Pages/widgets/prenotazioni.dart';
import 'package:go2beach/app.dart';
import 'package:go2beach/Pages/widgets/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection('users');
String? NomeLido;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  static String? getLido() {
    return NomeLido;
  }

  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  List<dynamic> users = [];
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() async {
    final snapshot =
        await usersRef.where("Email", isEqualTo: SignIn.getEmail()).get();
    setState(() {
      users = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Padding(
          //
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: Text(
                    "\nBentornato  ${users.map((user) => user['Nome']).toString().replaceAll((r"("), '').replaceAll((r")"), '')} ${users.map((user) => user['Cognome']).toString().replaceAll((r"("), '').replaceAll((r")"), '')}, ${SignIn.getEmail()}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: const Color.fromARGB(255, 131, 198, 230),
                ),
                Material(
                  color: Colors.blue,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        NomeLido = "Selvetta";
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Lido()));
                    },
                    child: Column(
                      children: [
                        Ink.image(
                          image: AssetImage("assets/images/selvetta.png"),
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 4
                              : MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
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
                Divider(
                  color: const Color.fromARGB(255, 131, 198, 230),
                ),
                Material(
                  color: Colors.blue,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        NomeLido = "Sirenetta";
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Lido()));
                    },
                    child: Column(
                      children: [
                        Ink.image(
                          image: AssetImage("assets/images/sirenetta.jpg"),
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 4
                              : MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
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
                  color: const Color.fromARGB(255, 131, 198, 230),
                ),
                Material(
                  color: Colors.blue,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        NomeLido = "Baracchino Rosso";
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Lido()));
                    },
                    child: Column(
                      children: [
                        Ink.image(
                          image: AssetImage("assets/images/baracchino.jpg"),
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 4
                              : MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
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
                  color: const Color.fromARGB(255, 131, 198, 230),
                ),
                Material(
                  color: Colors.blue,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        NomeLido = "Verde";
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Lido()));
                    },
                    child: Column(
                      children: [
                        Ink.image(
                          image: AssetImage("assets/images/verde.jpg"),
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 4
                              : MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
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
                  color: const Color.fromARGB(255, 131, 198, 230),
                ),
                Material(
                  color: Colors.blue,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        NomeLido = "Onde Blu";
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Lido()));
                    },
                    child: Column(
                      children: [
                        Ink.image(
                          image: AssetImage("assets/images/ondeblu.jpg"),
                          height: currenWidth < 600
                              ? MediaQuery.of(context).size.height / 4
                              : MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
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
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
