import 'package:flutter/material.dart';
import 'login-page.dart';
import 'profile-page.dart';
import 'calendar-page.dart';
import 'announcement.dart';
import 'notification-page.dart';
import 'package:intl/intl.dart';

class TimeAttendantPage extends StatefulWidget {
  // TimeAttendantPage({Key key}) : super(key: key);

  @override
  _TimeAttendantPageState createState() => _TimeAttendantPageState();
}

class _TimeAttendantPageState extends State<TimeAttendantPage> {
  @override
  void initState() {
    super.initState();
  }

  DateTime _dateNow = DateTime.now();
  String _timeFormat;
  String _dateFormat;
  String _msgSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Time Attendant',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
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
            leading: Icon(Icons.access_time),
            title: Text('Time Attendant'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TimeAttendantPage()));
            },
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
        child: Column(children: <Widget>[
          Center(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        getTimeNow(),
                        style: TextStyle(fontSize: 32.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        getDateNow(),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 300.0,
              // ),
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Card(
                    color: Colors.grey,
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'Time Working:  08:00 - 17:00',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 170.0,
                        height: 50.0,
                        child: RaisedButton(
                          color: Colors.green,
                          child: Text(
                            'Check In',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            showDialogSaveTime('in');
                          },
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 170.0,
                        height: 50.0,
                        child: RaisedButton(
                          color: Colors.orangeAccent,
                          child: Text(
                            'Check Out',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            showDialogSaveTime('out');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ]),
          )
        ]),
      ),
    );
  }

  getTimeNow() {
    return _timeFormat = DateFormat.Hms().format(_dateNow);
  }

  getDateNow() {
    return _dateFormat = DateFormat('EEEE,  d MMMM y').format(_dateNow);
  }

  Future<void> showDialogSaveTime(String _msgSave) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _msgSave == 'in'
                    ? Text('Do you want to check in of this time?')
                    : Text('Do you want to check out of this time?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // showDateCard(_formattDate, _formattTime);
              },
            ),
          ],
        );
      },
    );
  }
}
