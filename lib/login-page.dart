import 'package:flutter/material.dart';
import 'calendar-page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 20.0),
            child: Container(
              child: Center(
                child: Image.asset(
                  'assets/icons/brain2.png',
                  height: 130.0,
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(start: 12.0),
                        child: Icon(Icons.person),
                      ),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  onSaved: (value) => _username = value,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(start: 12.0),
                        child: Icon(Icons.lock),
                      ),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  onSaved: (value) => _password = value,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 50.0),
                child: Center(
                  child: _signinButton(),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget _signinButton() {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        setState(() {
          final form = _formKey.currentState;
          form.save();
          // setAuthToPreferences(_email, _password);
          routeToCalendarPage(context);
        });
      },
      color: Colors.blue,
      textColor: Colors.white,
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: Text('Login', style: TextStyle(fontSize: 18.0)),
    );
  }

  void routeToCalendarPage(context) {
    print('check ---> $_username : $_password');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CalendarPage()));
  }

  // Future<void> setAuthToPreferences(String _email, String _password) async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString(this._email, _email);
  // }

  // Future<String> getAuthFromPreferences() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String email;
  //   email = preferences.getString(this._email);
  //   return email;
  // }
}
