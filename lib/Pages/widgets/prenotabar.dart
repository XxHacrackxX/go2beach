import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:go2beach/Pages/widgets/lido.dart';

class PrenotaBar extends StatefulWidget {
  const PrenotaBar({super.key});
  @override
  State<StatefulWidget> createState() => _PrenotaBar();
}

class _PrenotaBar extends State<PrenotaBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(left: 47, right: 30, top: 10, bottom: 50),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Column(
                children: [
                  Text(
                    "Componi il tuo ordine",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    height: 40,
                    color: const Color.fromARGB(255, 131, 198, 230),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/cocacola.jpg',
                          height: 80.0,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: CustomizableCounter(
                          borderWidth: 5,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: 22,
                          onCountChange: (count) {},
                          onIncrement: (count) {},
                          onDecrement: (count) {},
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: const Color.fromARGB(255, 131, 198, 230),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/estathè.jpg',
                          height: 80.0,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: CustomizableCounter(
                          borderWidth: 5,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: 22,
                          onCountChange: (count) {},
                          onIncrement: (count) {},
                          onDecrement: (count) {},
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: const Color.fromARGB(255, 131, 198, 230),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/Koto_CaseStudy_Fanta_003-1_1921cae71.jpg',
                          height: 80.0,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: CustomizableCounter(
                          borderWidth: 5,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: 22,
                          onCountChange: (count) {},
                          onIncrement: (count) {},
                          onDecrement: (count) {},
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: const Color.fromARGB(255, 131, 198, 230),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/levissima.png',
                          height: 80.0,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: CustomizableCounter(
                          borderWidth: 5,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: 22,
                          onCountChange: (count) {},
                          onIncrement: (count) {},
                          onDecrement: (count) {},
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: const Color.fromARGB(255, 131, 198, 230),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/aperol.jpg',
                          height: 80.0,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: CustomizableCounter(
                          borderWidth: 5,
                          borderRadius: 100,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          textSize: 22,
                          onCountChange: (count) {},
                          onIncrement: (count) {},
                          onDecrement: (count) {},
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 50,
                    color: const Color.fromARGB(255, 131, 198, 230),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart_checkout),
                        label: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Completa l'ordine",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 131, 198, 230),
    );
  }
}
