import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:time_attendent_app/models/user-login-model.dart';

class AnnouncementPage extends StatefulWidget {
  final UserLogin user;

  AnnouncementPage({Key key, @required this.user}) : super(key: key);

  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Announcement')),
        backgroundColor: Hexcolor('#3f72af'),
        elevation: 0.0,
      ),
      // drawer: DrawerList(getUser: widget.user),
    );
  }
}
