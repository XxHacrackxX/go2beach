import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:go2beach/Pages/welcome_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: const MaterialApp(
        title: 'go2Beach',

        home: WelcomePage(),
        //! Leva il Banner di debug in alto a destra
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
