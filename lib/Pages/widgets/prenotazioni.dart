import 'package:flutter/material.dart';
import 'package:go2beach/Pages/widgets/visualizzaPBar.dart';
import 'package:go2beach/Pages/widgets/visualizzaPLido.dart';
import 'package:go2beach/misc/bubble_indicator_painter.dart';

class Prenotazioni extends StatefulWidget {
  const Prenotazioni({super.key});
  @override
  State<StatefulWidget> createState() => _Prenotazioni();
}

class _Prenotazioni extends State<Prenotazioni> {
  late PageController _pageController;
  Color bar = Colors.black;
  Color lido = Colors.white;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 20, bottom: 64, right: 20),
          child: Column(children: [
            _selectorWidget(),
            _pageViewWidget(),
          ]),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

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
                        "Bar",
                        style: TextStyle(color: bar, fontSize: 16),
                      ))),
              Expanded(
                  child: TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () => _pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate),
                      child: Text("Lido",
                          style: TextStyle(color: lido, fontSize: 16)))),
            ],
          ),
        ),
      );

  Widget _pageViewWidget() => Expanded(
        child: PageView(
            onPageChanged: (index) {
              setState(() {
                bar = index == 0 ? Colors.black : Colors.white;
                lido = index == 1 ? Colors.black : Colors.white;
              });
            },
            controller: _pageController,
            children: [
              //Visualizza Prenotazioni Bar e Lido
              visualizzaPBar(),
              visualizzaPLido(),
            ]),
      );
}
