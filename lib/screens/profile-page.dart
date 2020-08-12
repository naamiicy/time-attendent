import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_attendent_app/models/user-login-model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:time_attendent_app/screens/login-page.dart';

class ProfilePage extends StatefulWidget {
  final UserLogin getUser;

  ProfilePage({Key key, @required this.getUser}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserLogin _username;
  String _usernameText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#ea9a96'),
        elevation: 0.0,
      ),
      body: Container(
        color: Hexcolor('#ea9a96'),
        child: ListView(
          children: [
            Container(
              child: SvgPicture.asset(
                'assets/images/user2.svg',
                height: 100.0,
                width: 100.0,
                color: Colors.white70,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  child: Text(
                    _usernameText,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Container(
                height: 600.0,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListView(
                    padding: EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                    children: <Widget>[
                      ListTile(
                        title: Text('Employee ID : '),
                        trailing: Text('${_username.loginID}'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Name : '),
                        trailing: Text('Kannika Yudthayong'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('BirthDay : '),
                        trailing: Text('14 Feb 1996'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Sex : '),
                        trailing: Text('Female'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Email : '),
                        trailing: Text('naam.kannika@gmail.com'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Organization : '),
                        trailing: Text('THANASUP IMEX CO., LTD'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.white38,
                        textColor: Colors.white,
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        height: 60.0,
                        child: Text('Logout',
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.black87)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
