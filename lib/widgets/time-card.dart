import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowTimeCard extends StatefulWidget {
  @override
  _ShowTimeCardState createState() => _ShowTimeCardState();
}

class _ShowTimeCardState extends State<ShowTimeCard> {
  DateTime _dateNow = DateTime.now();
  String _timeFormat;
  String _currentAddress = 'Bangkok, Thailand';
  String _msgPopupSave;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 200.0,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.timer,
                        //   color: Colors.black87,
                        // ),
                        Text(
                          _timeFormat,
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.location_on,
                        //   color: Colors.black54,
                        // ),
                        Text(
                          '$_currentAddress',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5.0, 35.0, 5.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 140.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        'Clock In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        showDialogSaveTime('In');
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 140.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        'Clock Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.orangeAccent,
                      onPressed: () {
                        showDialogSaveTime('Out');
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showDialogSaveTime(String _msgPopupSave) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Warning',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _msgPopupSave == 'In'
                    ? Text('Clock In of this time?')
                    : Text('Clock Out of this time?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getTimeNow();
  }

  getTimeNow() {
    setState(() {
      _timeFormat = DateFormat.Hms().format(_dateNow);
    });
  }
}
