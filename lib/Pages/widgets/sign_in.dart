import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureTextPassword = true;
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
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
      );
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

          onSubmitted: (_) {
            //TODO: login
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
        onPressed: () {},
      );
}
