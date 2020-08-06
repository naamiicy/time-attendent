import 'package:flutter/material.dart';
import 'package:time_attendent_app/models/user-auth-model.dart';
import 'package:time_attendent_app/widgets/drawer-list.dart';

class NotificationPage extends StatefulWidget {
  final UserAuthentication user;

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
      ),
      drawer: DrawerList(getUser: widget.user),
    );
  }
}
