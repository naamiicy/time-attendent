import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:time_attendent_app/models/user-login-model.dart';
import 'package:time_attendent_app/screens/calendar-page.dart';
import 'package:random_string/random_string.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _userID;
  String _username;
  String _password;
  bool _showPassword = false;
  UserLogin _userLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 20.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/icons/brain2.png',
                  height: 110.0,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Hexcolor('#3f72af'),
                          ),
                        ),
                        Text(
                          'Employee',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Hexcolor('#3f72af'),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter your username';
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 16.0),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Username",
                        errorStyle: TextStyle(fontSize: 16.0),
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 12.0),
                          child: Icon(Icons.person),
                        ),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    onSaved: (value) {
                      _username = value;
                    }),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0),
                child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter your password';
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 16.0),
                    keyboardType: TextInputType.text,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorStyle: TextStyle(fontSize: 16.0),
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 12.0),
                          child: Icon(Icons.lock),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          color: _showPassword ? Colors.blue : Colors.grey,
                          onPressed: () {
                            setState(() => _showPassword = !_showPassword);
                          },
                        ),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    onSaved: (value) {
                      _password = value;
                    }),
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
      onPressed: () {
        setState(() {
          if (_formKey.currentState.validate()) {
            final form = _formKey.currentState;
            form.save();

            _userID = generateUserId();
            _userLogin = UserLogin(
              loginID: _userID,
              username: _username,
              password: _password,
            );
            routeToCalendarPage(_userLogin);
          } else {
            print('is not valid!!');
          }
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Hexcolor('#3f72af'),
      textColor: Colors.white,
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      height: 56.0,
      child: Text('Login', style: TextStyle(fontSize: 16.0)),
    );
  }

  String generateUserId() {
    return randomNumeric(6);
  }

  void routeToCalendarPage(UserLogin _userLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalendarPage(
          user: _userLogin,
        ),
      ),
    );
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
