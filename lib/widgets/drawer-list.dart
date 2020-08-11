import 'package:flutter/material.dart';
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
  String _usernameText;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Container(
          height: 130.0,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan[600],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black26,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                _usernameText,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              subtitle: Text(
                'Edit Profile',
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontSize: 12.0),
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
                            ProfilePage(user: widget.getUser)));
              },
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
    setState(() {
      _usernameText = widget.getUser.username;
    });
  }
}
