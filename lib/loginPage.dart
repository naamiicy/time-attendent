import 'package:flutter/material.dart';
import 'calendarPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 120.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              width: 150.0,
              height: 150.0,
              child: Image.asset('assets/icons/brain2.png'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email Address",
                      prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 12.0),
                          child: Icon(Icons.email)),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  onSaved: (value) => _email = value),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 12.0),
                          child: Icon(Icons.vpn_key)),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  onSaved: (value) => _password = value),
            ),
            SizedBox(
              height: 20.0,
            ),
            _signinButton(),
          ],
        ),
      ),
    ));
  }

  Widget _signinButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () {
          setState(() {
            final form = _formKey.currentState;
            form.save();
            setAuthToPreferences(_email, _password);
            routeToHomePage(context);
          });
        },
        color: Colors.blue,
        textColor: Colors.white,
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Text('Login', style: TextStyle(fontSize: 18.0)),
      ),
    );
  }

  void routeToHomePage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CalendarPage()));
  }

  Future<void> setAuthToPreferences(String _email, String _password) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(this._email, _email);
  }

  // Future<String> getAuthFromPreferences() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String email;
  //   email = preferences.getString(this._email);
  //   return email;
  // }
}
