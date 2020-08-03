import 'package:flutter/material.dart';
import 'package:time_attendent_app/widget/drawer-list.dart';

class AnnouncementPage extends StatefulWidget {
  AnnouncementPage({Key key}) : super(key: key);

  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Announcement')),
      ),
      drawer: DrawerList(),
    );
  }
}
