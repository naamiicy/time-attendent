import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:time_attendent_app/models/user-login-model.dart';
import 'package:time_attendent_app/screens/map-location.dart';
import 'package:time_attendent_app/screens/profile-page.dart';
import 'package:time_attendent_app/screens/calendar-page.dart';
import 'package:time_attendent_app/screens/login-page.dart';

class DrawerList extends StatefulWidget {
  final UserLogin getUser;

  DrawerList({Key key, @required this.getUser}) : super(key: key);

  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  UserLogin _username;
  String _usernameText;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Container(
          height: 175.0,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Hexcolor('#3f72af'),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20.0, 8.0, 20.0),
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/user2.svg',
                  color: Colors.white70,
                  height: 60.0,
                  width: 60.0,
                ),
                title: Padding(
                  padding: EdgeInsets.fromLTRB(0, 5.0, 8.0, 5.0),
                  child: Text(
                    _usernameText,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.fromLTRB(0, 5.0, 8.0, 5.0),
                  child: Text(
                    'Programmer',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                trailing: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 18.0,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(getUser: widget.getUser)));
                },
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.insert_invitation),
          title: Text('Calendar'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CalendarPage(user: widget.getUser)));
          },
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Clocking GPS'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MapLocation(user: widget.getUser)));
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.announcement),
        //   title: Text('Announcement'),
        //   trailing: Icon(Icons.chevron_right),
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) =>
        //                 AnnouncementPage(user: widget.getUser)));
        //   },
        // ),
        // ListTile(
        //   leading: Icon(Icons.notifications),
        //   title: Text('Notification'),
        //   trailing: Icon(Icons.chevron_right),
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) =>
        //                 NotificationPage(user: widget.getUser)));
        //   },
        // ),
        ListTile(
          leading: Icon(Icons.supervised_user_circle),
          title: Text('Logout'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        )
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() {
    _username = widget.getUser;

    setState(() {
      if (_username.username != null) {
        _usernameText = _username.username;
      }
    });
  }
}
