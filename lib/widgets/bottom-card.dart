import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:time_attendent_app/models/user-address-model.dart';
import 'package:time_attendent_app/models/user-login-model.dart';
import 'package:time_attendent_app/models/user-work-model.dart';
import 'package:time_attendent_app/screens/calendar-page.dart';
import 'package:intl/intl.dart';

class BottomCard extends StatefulWidget {
  final UserLogin getUser;
  final UserAddress userAddress;

  BottomCard({Key key, this.getUser, this.userAddress}) : super(key: key);

  @override
  _BottomCardState createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  DateTime _date;
  String _time;
  String _clocking;
  // UserWork _userWork;
  List<UserWork> _userWork = <UserWork>[];

  Widget showLoading() {
    return SpinKitThreeBounce(
      color: Colors.lightBlue,
      size: 50.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(
                0,
                0,
                0,
                0.15,
              ),
              blurRadius: 25.0,
            ),
          ],
          color: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 160.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        'CLOCK IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Colors.green[400],
                      onPressed: () {
                        _clocking = 'IN';
                        showDialogSave(_clocking);
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 160.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        'CLOCK OUT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Colors.red[400],
                      onPressed: () {
                        _clocking = 'OUT';
                        showDialogSave(_clocking);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> showDialogSave(String isClocking) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text('This will save your current time and location.'),
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
                setState(() {
                  saveDateTime(isClocking);
                  routeToTimeAttendantPage();
                });
              },
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getDateTime();
  }

  getDateTime() {
    setState(() {
      _date = DateTime.now();
      _time = DateFormat.Hms().format(_date);
    });
  }

  void saveDateTime(String isClocking) {
    setState(() {
      _userWork.add(UserWork(
        workType: isClocking,
        workDate: _date,
        workAddress: widget.userAddress,
      ));
    });
  }

  void routeToTimeAttendantPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalendarPage(
          user: widget.getUser,
          userWork: _userWork,
        ),
      ),
    );
  }
}
