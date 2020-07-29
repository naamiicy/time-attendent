import 'package:flutter/material.dart';
import 'login-page.dart';
import 'profile-page.dart';
import 'announcement.dart';
import 'notification-page.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int _selectedIndex = 0;
  List _pages = [
    Text("Calendar"),
    Text("Notification"),
    Text("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calendar')),
      ),
      drawer: Drawer(
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
              leading: Icon(Icons.insert_invitation),
              title: Text('Calendar'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalendarPage()));
              }),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              })
        ]),
      ),
      body: Container(
        child: Text('hello'),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.insert_invitation),
      //       title: Text('Calendar'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications_active),
      //       title: Text('Notification'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle),
      //       title: Text('Profile'),
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blue,
      //   onTap: onSelectItemIndex,
      // ),
    );
  }

  void onSelectItemIndex(int index) {
    setState(() {
      _selectedIndex = index;
      print('$_selectedIndex');
    });
  }
}
