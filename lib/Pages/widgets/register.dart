import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../homepage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureTextPassword = true;
  bool _obscureTextPassword1 = true;
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _focusNodeCognome = FocusNode();
  final _focusNodeNome = FocusNode();
  final _focusNodeData = FocusNode();
  final _focusNodeConfermaPassword = FocusNode();
  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeCognome.dispose();
    _focusNodeConfermaPassword.dispose();
    _focusNodeData.dispose();
    _focusNodeNome.dispose();
    super.dispose();
  }

  Future<User?> registerUsingEmailPassword(
      {required String Nome,
      required String Cognome,
      required String Data,
      required String email,
      required String password,
      required String ConfermaPassword,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = <String, dynamic>{
      "Nome": "$Nome",
      "Cognome": "$Cognome",
      "Data": "$Data",
      "Email": "$email",
      "Password": "$password",
    };
    User? user2;
    if (password == ConfermaPassword) {
      try {
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password);
        db.collection("users").add(user).then((DocumentReference doc) =>
            print('DocumentSnapshot added with ID: ${doc.id}'));
        user2 = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          print("Email gia' in uso");
          customAlertDialog(context);
        }
      }
      return user2;
    } else {
      customAlertDialogPassword(context);
      return user2;
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ConfermapasswordController =
      TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cognomeController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _formWidget(),
              _signInButton(),
            ],
          ),
        ),
      );
  Widget _formWidget() => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 24),
              width: 300,
              child: Column(children: [
                _nomeField(),
                const Divider(height: 0),
                _cognomeField(),
                const Divider(height: 0),
                _datanascitaField(),
                const Divider(height: 0),
                _emailField(),
                const Divider(height: 0),
                _passwordField(),
                const Divider(height: 0),
                _confermapasswordField(),
              ]),
            )),
      );
  Widget _nomeField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextFormField(
          controller: _nomeController,
          validator: (value) => value != null ? 'Inserisci il nome' : null,
          focusNode: _focusNodeNome,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Inserisci Nome',
              hintStyle: TextStyle(fontSize: 17),
              icon: Icon(
                Icons.people_alt,
                size: 22,
              )),
          onFieldSubmitted: (_) {
            _focusNodeCognome.requestFocus();
          },
        ),
      );
  Widget _cognomeField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextFormField(
          controller: _cognomeController,
          validator: (value) => value != null ? 'Inserisci il nome' : null,
          focusNode: _focusNodeCognome,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Inserisci Cognoome',
              hintStyle: TextStyle(fontSize: 17),
              icon: Icon(
                Icons.people,
                size: 22,
              )),
          onFieldSubmitted: (_) {
            _focusNodeData.requestFocus();
          },
        ),
      );
  Widget _datanascitaField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextFormField(
          controller: _dataController,
          validator: (value) =>
              value != null ? 'Inserisci la data di nascita' : null,
          keyboardType: TextInputType.datetime,
          focusNode: _focusNodeData,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Inserisci Data di Nascita',
              hintStyle: TextStyle(fontSize: 17),
              icon: Icon(
                Icons.calendar_month,
                size: 22,
              )),
          onFieldSubmitted: (_) {
            _focusNodeEmail.requestFocus();
          },
        ),
      );
  Widget _emailField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextFormField(
          validator: (email) {
            email != null && !EmailValidator.validate(email)
                ? 'Inserisci un e-mail valida'
                : null;
          },
          controller: _emailController,
          focusNode: _focusNodeEmail,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Inserisci Indirizzo email',
              hintStyle: TextStyle(fontSize: 17),
              icon: Icon(
                Icons.email,
                size: 22,
              )),
          onFieldSubmitted: (_) {
            _focusNodePassword.requestFocus();
          },
        ),
      );
  Widget _passwordField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextFormField(
          validator: (value) => value != null && value.length < 6
              ? 'Inserisci almeno 6 caratteri'
              : null,
          controller: _passwordController,
          focusNode: _focusNodePassword,
          obscureText: _obscureTextPassword,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Inserisci Password',
              hintStyle: const TextStyle(fontSize: 17),
              icon: const Icon(
                Icons.password,
                size: 22,
              ),
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureTextPassword = !_obscureTextPassword;
                    });
                  },
                  child: Icon(
                    _obscureTextPassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye_rounded,
                    size: 22,
                    color: Colors.black,
                  ))),
          onFieldSubmitted: (_) {
            _focusNodeConfermaPassword.requestFocus();
          },
        ),
      );
  Widget _confermapasswordField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextFormField(
          validator: (value) => value != null && value.length < 6
              ? 'Inserisci almeno 6 caratteri'
              : null,
          controller: _ConfermapasswordController,
          focusNode: _focusNodeConfermaPassword,
          obscureText: _obscureTextPassword1,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Conferma Password',
              hintStyle: const TextStyle(fontSize: 17),
              icon: const Icon(
                Icons.lock,
                size: 22,
              ),
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureTextPassword1 = !_obscureTextPassword1;
                    });
                  },
                  child: Icon(
                    _obscureTextPassword1
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye_rounded,
                    size: 22,
                    color: Colors.black,
                  ))),
          onFieldSubmitted: (_) async {
            User? user = await registerUsingEmailPassword(
                Nome: _nomeController.text,
                Cognome: _cognomeController.text,
                Data: _dataController.text,
                email: _emailController.text,
                password: _passwordController.text,
                ConfermaPassword: _ConfermapasswordController.text,
                context: context);
            if (user != null) {
              customAlertDialogConSuccesso(context);
            }
          },
          textInputAction: TextInputAction.go,
        ),
      );
  Widget _signInButton() => ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48),
          child: Text(
            'REGISTRATI',
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
        onPressed: () async {
          User? user = await registerUsingEmailPassword(
              Nome: _nomeController.text,
              Cognome: _cognomeController.text,
              Data: _dataController.text,
              email: _emailController.text,
              password: _passwordController.text,
              ConfermaPassword: _ConfermapasswordController.text,
              context: context);
          if (user != null) {
            customAlertDialogConSuccesso(context);
          }
        },
      );
  static void customAlertDialog(BuildContext context) {
    Widget okButton = ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    var dialog = AlertDialog(
      title: const Text("Errore"),
      content: const Text("Email gia' in uso"),
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
      title: const Text("Registrazione avvenuta con successo!"),
      content: const Text("Ora puoi effettuare il Login"),
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

  static void customAlertDialogPassword(BuildContext context) {
    Widget okButton = ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    var dialog = AlertDialog(
      title: const Text("Errore"),
      content: const Text("Le password non coincidono"),
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
