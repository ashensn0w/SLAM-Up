import 'package:flutter/material.dart';
import 'package:slam_up/utils/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class ViewTransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primLightBg,
      appBar: AppBar(
        title: Text(
          'View All',
          style: TextStyle(
            color: darkText,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            darkBackButton,
          ),
        ),
      ),
      body: Column(
        children: [
          MyCalendar(),
          TransactionList(), // Wrap TransactionList in a Column directly
        ],
      ),
    );
  }
}

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: TableCalendar(
            locale: 'en_US',
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: darkText,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: darkText,
              ),
              weekendStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: darkText,
              ),
            ),
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                color: darkText,
              ),
              selectedTextStyle: TextStyle(
                color: Color(0xFF39524F), // Set your desired color
                fontWeight: FontWeight.bold,
              ),
              selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: Color(0xFF39524F),
                  width: 2.0,
                ),
              ),
              todayTextStyle: TextStyle(
                color: Colors.white, // Set your desired color
                fontWeight: FontWeight.bold,
              ),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF39524F),
              ),
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2050, 12, 31),
            onDaySelected: _onDaySelected,
          ),
        ),
      ],
    );
  }
}

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: seconDarkBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Center(
          child: Text(
            'Your Container Content',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
