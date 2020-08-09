import 'package:flutter/material.dart';
import 'package:time_attendent_app/models/user-address-model.dart';
import 'package:intl/intl.dart';

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
                  '$_timeFormat',
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
                  child: Icon(Icons.home),
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
    getTimeNow();
    getAddress();
  }

  void getTimeNow() {
    setState(() {
      _timeFormat = DateFormat.Hms().format(_dateNow);
    });
  }

  getAddress() {
    UserAddress addr = widget.userAddress;

    setState(() {
      _currentAddress =
          '${addr.name} ${addr.locality} ${addr.administrativeArea} ${addr.country}';
    });
  }
}
