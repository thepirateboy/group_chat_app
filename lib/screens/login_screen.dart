import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_chat_app/items.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Container(
                  height: 200.0,
                  child: Icon(
                    FontAwesomeIcons.bolt,
                    color: Colors.amberAccent,
                    size: 150,
                  )),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
              },
              style: TextStyle(color: Colors.lightBlueAccent),
              decoration: LoginTextDecor(
                theText: 'Enter your username',
                theColor: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
              },
              style: TextStyle(color: Colors.lightBlueAccent),
              decoration: LoginTextDecor(
                  theText: 'Enter your password',
                  theColor: Colors.lightBlueAccent),
            ),
            SizedBox(
              height: 24.0,
            ),
            LoginButton(
              theText: 'Login',
              theOnPressed: () {
                // Navigator.pushNamed(context, LoginScreen.id);
              },
              theColor: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
