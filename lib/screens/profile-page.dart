import 'package:flutter/material.dart';
import 'package:time_attendent_app/models/user-auth-model.dart';
import 'package:time_attendent_app/widgets/drawer-list.dart';

class ProfilePage extends StatefulWidget {
  final UserAuthentication user;

  ProfilePage({Key key, @required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
      ),
      drawer: DrawerList(getUser: widget.user),
    );
  }
}
