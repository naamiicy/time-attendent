import 'package:flutter/material.dart';
import 'package:time_attendent_app/models/user-address-model.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class AddressCard extends StatefulWidget {
  final UserAddress userAddress;

  AddressCard({Key key, @required this.userAddress}) : super(key: key);

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  DateTime _dateNow = DateTime.now();
  String _timeFormat;
  String _currentAddress;

  String _timeString;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 35.0,
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                leading: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.timer),
                ),
                title: Text(
                  '$_timeString',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                leading: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.location_on),
                ),
                title: Text(
                  '$_currentAddress',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getTimeCount();
    getAddress();
  }

  void getTimeCount() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      _getTime();
    });
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM//yyyy  hh:mm:ss').format(dateTime);
  }

  getAddress() {
    UserAddress add = widget.userAddress;
    _currentAddress =
        '${add.locality} ${add.administrativeArea} ${add.country}';
  }
}
