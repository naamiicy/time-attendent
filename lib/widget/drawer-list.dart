import 'package:flutter/material.dart';
import 'package:time_attendent_app/screen/map-location.dart';
import 'package:time_attendent_app/screen/profile-page.dart';
import 'package:time_attendent_app/screen/time-attendant-page.dart';
import 'package:time_attendent_app/screen/calendar-page.dart';
import 'package:time_attendent_app/screen/announcement-pge.dart';
import 'package:time_attendent_app/screen/notification-page.dart';
import 'package:time_attendent_app/screen/login-page.dart';

class DrawerList extends StatefulWidget {
  DrawerList({Key key}) : super(key: key);

  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Container(
          height: 130.0,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
              title: Text(
                'Username',
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Location'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MapLocation()));
          },
        ),
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text('Time Attendant'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TimeAttendantPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.insert_invitation),
          title: Text('Calendar'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CalendarPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.announcement),
          title: Text('Announcement'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnnouncementPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notification'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationPage()));
          },
        ),
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
}
