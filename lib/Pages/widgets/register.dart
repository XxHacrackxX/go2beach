import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _obscureTextPassword = true;
  bool _obscureTextPassword1 = true;
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _focusNodeCognome = FocusNode();
  final _focusNodeNome = FocusNode();
  final _focusNodeData = FocusNode();
  final _focusNodeConfermaPassword = FocusNode();
  User? user;
  @override
  Future signUp() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;
    /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
                child: CircularProgressIndicator(
              key: formkey,
            )));*/
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }

  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _formWidget(),
                  _signInButton(),
                ],
              ),
            ],
          ),
        ),
      );
  Widget _formWidget() => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Form(
          key: formkey,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
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
          ),
        ),
      );
  Widget _nomeField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextField(
          focusNode: _focusNodeNome,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Inserisci Nome',
              // aggiungere nel pubspec.yaml il pacchetto font_awesome_flutter
              hintStyle: TextStyle(fontSize: 17),
              icon: Icon(
                Icons.people_alt,
                size: 22,
              )),
          onSubmitted: (_) {
            _focusNodeCognome.requestFocus();
          },
        ),
      );
  Widget _cognomeField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextField(
          focusNode: _focusNodeCognome,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Inserisci Cognoome',
              // aggiungere nel pubspec.yaml il pacchetto font_awesome_flutter
              hintStyle: TextStyle(fontSize: 17),
              icon: Icon(
                Icons.people,
                size: 22,
              )),
          onSubmitted: (_) {
            _focusNodeData.requestFocus();
          },
        ),
      );
  Widget _datanascitaField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextField(
          keyboardType: TextInputType.datetime,
          focusNode: _focusNodeData,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Inserisci Data di Nascita',
              // aggiungere nel pubspec.yaml il pacchetto font_awesome_flutter
              hintStyle: TextStyle(fontSize: 17),
              icon: Icon(
                Icons.calendar_month,
                size: 22,
              )),
          onSubmitted: (_) {
            _focusNodeEmail.requestFocus();
          },
        ),
      );
  Widget _emailField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) {
            email != null && !EmailValidator.validate(email)
                ? 'Enter a valid email'
                : null;
          },
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
          onSaved: (_) {
            _focusNodePassword.requestFocus();
          },
          controller: _emailController,
        ),
      );
  Widget _passwordField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextFormField(
          controller: _passwordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => value != null && value.length < 6
              ? 'Inserisci almeno 6 caratteri'
              : null,
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
          // nella login_page si wrappa tutto il container di riga 35 in un SingleChildScrollView poi si imposta una height: MediaQuery.of(context).size.height
          // la medesima cosa anche con width: MediaQuery.of(context).size.height
          onSaved: (_) {
            _focusNodeConfermaPassword.requestFocus();
          },
        ),
      );
  Widget _confermapasswordField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: TextField(
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
          onSubmitted: (_) {
            //TODO: registrazione
          },
          textInputAction: TextInputAction.go,
        ),
      );
  Widget _signInButton() => ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48),
          child: Text(
            'REGISTRATI',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        onPressed: () {
          signUp();
        },
      );
}

class Utils {
  static showSnackBar(String? text) {
    final messengerKey = GlobalKey<ScaffoldMessengerState>();
    if (text == null) return;
    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
