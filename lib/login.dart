import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = 'test@gmail.com';
  String _password = '1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test Login'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: 240.0,
                  height: 240.0,
                  child: Image.asset('assets/icons/brain1.png'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    onSaved: (value) => _email = value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email Address")),
                TextFormField(
                    onSaved: (value) => _password = value,
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password")),
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
    return Container(
      child: RaisedButton(
        onPressed: () {
          final form = _formKey.currentState;
          form.save();

          if (form.validate()) {
            print('$_email : $_password');
          }
        },
        child: Text('Sign In', style: TextStyle(fontSize: 20)),
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
