import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go2beach/Pages/homepage.dart';
import 'package:go2beach/Pages/welcome_page.dart';

String? email;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static String? getEmail() {
    return email;
  }

  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureTextPassword = true;
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email" || e.code == "wrong-password") {
        print("Email o password sbagliata");
        customAlertDialog(context);
      }
    }
    return user;
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              FutureBuilder(
                future: _initializeFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _formWidget();
                  }
                  return _signInButton();
                },
              ),
              _signInButton()
            ],
          ),
        ],
      ),
    );
  }

  Widget _formWidget() => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 24),
              width: 300,
              child: Column(children: [
                _emailField(),
                const Divider(height: 0),
                _passwordField(),
              ]),
            )),
      );
  Widget _emailField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextField(
          controller: _emailController,
          focusNode: _focusNodeEmail,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Indirizzo email',
              hintStyle: TextStyle(fontSize: 17),
              icon: Icon(
                Icons.email,
                size: 22,
              )),
          onSubmitted: (_) {
            _focusNodePassword.requestFocus();
          },
        ),
      );
  Widget _passwordField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextField(
          controller: _passwordController,
          focusNode: _focusNodePassword,
          obscureText: _obscureTextPassword,
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
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
          onSubmitted: (_) async {
            User? user = await loginUsingEmailPassword(
                email: _emailController.text,
                password: _passwordController.text,
                context: context);
            if (user != null) {
              setState(() {
                email = _emailController.text;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => (HomePage())));
            }
          },
          textInputAction: TextInputAction.go,
        ),
      );
  Widget _signInButton() => ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48),
          child: Text(
            'ACCEDI',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        onPressed: () async {
          User? user = await loginUsingEmailPassword(
              email: _emailController.text,
              password: _passwordController.text,
              context: context);
          print(user);
          if (user != null) {
            setState(() {
              email = _emailController.text;
            });
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => (HomePage())));
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
      content: const Text("Utente o password sbagliato"),
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
