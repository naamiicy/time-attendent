import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  // CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int _selectedIndex = 0;
  List _pages = [
    Text("Calendar"),
    Text("Notification"),
    Text("Profile"),
  ];
  final CalendarController _calendarController = CalendarController();
  // Map<DateTime, List> _events;
  // Map<DateTime, List> _visibleEvents;
  // List _selectedEvents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: _pages[_selectedIndex]),
          leading: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.menu,
              ))),
      body: Column(
        children: <Widget>[tableCalendar(), datetimeCard()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onSelectItemIndex,
      ),
    );
  }

  Widget tableCalendar() {
    return Container(
      child: TableCalendar(
        locale: 'en_US',
        calendarController: _calendarController,
        onDaySelected: getDateTime,
      ),
    );
  }

  Widget datetimeCard() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(''),
              subtitle: Text(''),
              trailing: FlatButton(
                color: Colors.blue,
                child: Text('Check In',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              color: Colors.white,
                              child: Column(children: [
                                ListTile(
                                    title: Center(
                                  child: Text('Check In'),
                                ))
                              ]),
                            ));
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initState() {
    super.initState();
  }

  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  String getDateTime(DateTime date, List events) {
    DateTime _selectedDate;
    String _formattDate;

    DateTime _dateToday;
    String _formattDateToday;
    String _formattTimeToday;

    _selectedDate = date;
    _formattDate = getDateFormatt(_selectedDate);

    _dateToday = DateTime.now();
    _formattDateToday = getDateFormatt(_dateToday);

    setState(() {
      if (_formattDate == _formattDateToday) {
        _formattTimeToday = DateFormat('kk:mm').format(_dateToday);
        print('if Check time format: $_formattTimeToday');
        return _formattTimeToday;
      } else {
        print('else Check time format: $_formattDate');
        return _formattDate;
      }
    });
    // _selectedEvents = events;
    // print('Show events: $events');
  }

  getDateFormatt(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  void onSelectItemIndex(int index) {
    setState(() {
      _selectedIndex = index;
      print('$_selectedIndex');
    });
  }
}
