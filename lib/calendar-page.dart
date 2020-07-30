import 'package:flutter/material.dart';
import 'login-page.dart';
import 'profile-page.dart';
import 'announcement.dart';
import 'notification-page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int _selectedIndex = 0;
  final CalendarController _calendarController = CalendarController();
  String _formattDateSelected;
  DateTime _dateToday;
  String _formattDateToday;
  String _formattTimeToday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calendar')),
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          Container(
            height: 130.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
                title: Text(
                  'Username',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                subtitle: Text(
                  'Edit Profile',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontSize: 12.0),
                ),
                trailing: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 18.0,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.insert_invitation),
            title: Text('Calendar'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CalendarPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('Announcement'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnnouncementPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text('Logout'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ]),
      ),
      body: Container(
        child: TableCalendar(
          calendarController: _calendarController,
          locale: 'en_US',
          onDaySelected: getDateTime,
        ),
      ),
    );
  }

  getDateTime(DateTime _date, List _events) {
    DateTime _selectedDate;
    _selectedDate = _date;
    _formattDateSelected = DateFormat('EEEE,  d MMMM ,y').format(_selectedDate);

    //***Check select today***//
    _dateToday = DateTime.now();
    _formattDateToday = DateFormat('EEEE,  d MMMM,y').format(_dateToday);
    _formattTimeToday = DateFormat.Hms().format(_dateToday);
    // print('Today ===> $_formattDateToday : $_formattTimeToday');
    // print('Select ==> $_formattDateSelected');

    if (_formattDateSelected == _formattDateToday) {
      showModalDate(_formattDateToday, _formattTimeToday);
    } else {
      showModalDate(_formattDateSelected, _formattTimeToday);
    }
    // _selectedEvents = events;
    // print('Show events: $events');
  }

  Future<void> showModalDate(String _currentDate, String _currentTime) {
    print('check date : $_currentTime');
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 230.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '$_currentTime',
                            style: TextStyle(fontSize: 32.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '$_currentDate',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text('Check In'),
                          onPressed: () {},
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.deepOrange,
                          textColor: Colors.white,
                          child: Text('Check Out'),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  // void initState() {
  //   super.initState();
  // }

  // void dispose() {
  //   _calendarController.dispose();
  //   super.dispose();
  // }

  void onSelectItemIndex(int index) {
    setState(() {
      _selectedIndex = index;
      print('$_selectedIndex');
    });
  }
}
