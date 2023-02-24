import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});
  @override
  State<StatefulWidget> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      child: Scaffold(
        body: MonthView(
          controller: EventController(),
          minMonth: DateTime(1990),
          maxMonth: DateTime(2050),
          cellAspectRatio: 1,
          onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
          onCellTap: (events, date) {
            // Implement callback when user taps on a cell.
            print(events);
          },
          startDay: WeekDays.sunday, // To change the first day of the week.
          // This callback will only work if cellBuilder is null.
          onEventTap: (event, date) => print(event),
          onDateLongPress: (date) => print(date),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
