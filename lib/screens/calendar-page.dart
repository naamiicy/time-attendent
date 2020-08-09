import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:time_attendent_app/models/user-auth-model.dart';
import 'package:time_attendent_app/widgets/drawer-list.dart';

class CalendarPage extends StatefulWidget {
  final UserAuthentication user;

  CalendarPage({Key key, @required this.user}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CalendarController _calendarController = CalendarController();
  String _formattDateSelected;
  DateTime _dateSelect;
  DateTime _dateToday = DateTime.now();
  // String _formattDateToday = DateFormat('EEEE,  d MMMM ,y').format(_dateToday);
  // String _formattTimeToday = DateFormat.Hms().format(_dateToday);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calendar')),
      ),
      drawer: DrawerList(getUser: widget.user),
      body: Column(
        children: <Widget>[
          TableCalendar(
            calendarController: _calendarController,
            locale: 'en_US',
            onDaySelected: getDateSelect,
          ),
          showDateCard(_dateToday)
        ],
      ),
    );
  }

  showDateCard(DateTime _dateToday) {
    String _time = DateFormat.Hms().format(_dateToday);
    return Card(
      child: ListTile(
        title: Text('$_time'),
        trailing: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => MapLocation(
            //               user: widget.user,
            //             )));
          },
        ),
      ),
    );
  }

  getDateSelect(DateTime _date, List _events) {
    _dateSelect = _date;
    _formattDateSelected = DateFormat('EEEE,  d MMMM ,y').format(_dateSelect);

    setState(() {
      showDateCard(_dateToday);
    });
    print('date select $_formattDateSelected ==> ');

    // _selectedEvents = events;
    // print('Show events: $events');
  }
}
