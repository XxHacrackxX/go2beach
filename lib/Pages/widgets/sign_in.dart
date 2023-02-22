import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go2beach/Pages/homepage.dart';
import 'package:go2beach/Pages/welcome_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
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
      if (e.code == "user-not.found") {
        print("Utente non trovato");
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
              // aggiungere nel pubspec.yaml il pacchetto font_awesome_flutter
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
              // aggiungere nel pubspec.yaml il pacchetto font_awesome_flutter
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
          // nella login_page si wrappa tutto il container di riga 35 in un SingleChildScrollView poi si imposta una height: MediaQuery.of(context).size.height
          // la medesima cosa anche con width: MediaQuery.of(context).size.height

          onSubmitted: (_) async {
            User? user = await loginUsingEmailPassword(
                email: _emailController.text,
                password: _passwordController.text,
                context: context);
            print(user);
            if (user != null) {
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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => (HomePage())));
          }
        },
      );
}
