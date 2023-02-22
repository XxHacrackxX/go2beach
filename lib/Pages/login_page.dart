import 'package:flutter/material.dart';
import 'package:go2beach/Pages/widgets/register.dart';
import 'package:go2beach/Pages/widgets/sign_in.dart';
import 'package:go2beach/app.dart';
import 'package:go2beach/misc/bubble_indicator_painter.dart';
import 'package:go2beach/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late PageController _pageController;
  Color signIn = Colors.black;
  Color signUp = Colors.white;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(64),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                CustomTheme.gradientStart,
                CustomTheme.gradientEnd,
              ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 1.0))),
          child: Column(children: [
            _logoWidget(),
            _selectorWidget(),
            _pageViewWidget(),
          ]),
        ),
      ),
    );
  }

  Widget _logoWidget() => Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Image(
          image: AssetImage('assets/images/undraw_Beach_day_cser.png'),
          height: 100,
        ),
      );

  Widget _selectorWidget() => Container(
        width: 300,
        height: 50,
        margin: const EdgeInsets.only(top: 32),
        decoration: const BoxDecoration(
          color: Color(0x552B2B2B),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: CustomPaint(
          painter: BubbleIndicatorPainter(pageController: _pageController),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () => _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate),
                      child: Text(
                        "Accedi",
                        style: TextStyle(color: signIn, fontSize: 16),
                      ))),
              Expanded(
                  child: TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () => _pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate),
                      child: Text("Registrati",
                          style: TextStyle(color: signUp, fontSize: 16)))),
            ],
          ),
        ),
      );

  Widget _pageViewWidget() => Expanded(
        child: PageView(
            onPageChanged: (index) {
              setState(() {
                signIn = index == 0 ? Colors.black : Colors.white;
                signUp = index == 1 ? Colors.black : Colors.white;
              });
            },
            controller: _pageController,
            children: const [
              SignIn(),
              Register(),
            ]),
      );
}
