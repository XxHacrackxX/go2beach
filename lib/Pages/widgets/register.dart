import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        child: TextField(
          focusNode: _focusNodeEmail,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 12.0, color: Colors.black),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Inserisci Indirizzo email',
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
          onSubmitted: (_) {
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
        onPressed: () {},
      );
}
