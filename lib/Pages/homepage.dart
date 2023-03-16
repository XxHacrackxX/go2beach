import 'package:flutter/widgets.dart';
import 'package:go2beach/Pages/widgets/altro.dart';
import 'package:go2beach/Pages/widgets/calendar.dart';
import 'package:go2beach/Pages/widgets/home.dart';
import 'package:go2beach/Pages/widgets/prenotazioni.dart';
import 'package:go2beach/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final String title = 'HOME';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Prenotazioni(),
    Calendar(),
    Altro(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 131, 198, 230),
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: CustomTheme.gradientStart,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Prenotazioni'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Calendario'),
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Altro'),
          ]),
    );
  }
}
