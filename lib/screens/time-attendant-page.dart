import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_attendent_app/models/user-auth-model.dart';
import 'package:time_attendent_app/widgets/drawer-list.dart';

class TimeAttendantPage extends StatefulWidget {
  final UserAuthentication user;

  TimeAttendantPage({Key key, @required this.user}) : super(key: key);

  @override
  _TimeAttendantPageState createState() => _TimeAttendantPageState();
}

class _TimeAttendantPageState extends State<TimeAttendantPage> {
  DateTime _dateNow = DateTime.now();
  String _timeFormat;
  String _dateFormat;

  @override
  void initState() {
    super.initState();
    getTimeNow();
    getDateNow();
  }

  getTimeNow() {
    _timeFormat = DateFormat.Hms().format(_dateNow);
  }

  getDateNow() {
    _dateFormat = DateFormat('EEEE,  d MMMM y').format(_dateNow);
  }

  Future<void> showDialogSaveTime() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to check in of this time?'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Time Attendant')),
      ),
      drawer: DrawerList(getUser: widget.user),
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
                        _timeFormat,
                        style: TextStyle(fontSize: 32.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        _dateFormat,
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
                            showDialogSaveTime();
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
                            showDialogSaveTime();
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
}
