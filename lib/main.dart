import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:time_attendent_app/screens/login-page.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  initializeDateFormatting().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Attendent',
      theme: ThemeData(
        primaryColor: Hexcolor('#3f72af'),
      ),
      home: LoginPage(),
    );
  }
}
