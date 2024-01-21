import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade800,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'History',
        ),
        elevation: 0,
        backgroundColor: Colors.indigo.shade800,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: TableCalendar(
                    firstDay: DateTime.now().subtract(Duration(days: 365)),
                    lastDay: DateTime.now().add(Duration(days: 365)),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                    ),
                    // Add more configuration as needed
                  ),
                ),
                SizedBox(
                  height: 400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
