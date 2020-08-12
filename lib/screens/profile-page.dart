import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_attendent_app/models/user-login-model.dart';
import 'package:hexcolor/hexcolor.dart';

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
                height: 800.0,
                color: Colors.white,
              ),
            )
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
