import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:time_attendent_app/models/user-login-model.dart';

class NotificationPage extends StatefulWidget {
  final UserLogin user;

  NotificationPage({Key key, @required this.user}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Notification')),
        backgroundColor: Hexcolor('#ea9a96'),
        elevation: 0.0,
      ),
      // drawer: DrawerList(getUser: widget.user),
    );
  }
}
