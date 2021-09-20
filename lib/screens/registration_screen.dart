import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_chat_app/items.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                  size: 150,
                  color: Colors.amberAccent,
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              style: TextStyle(color: Colors.blueAccent),
              decoration: LoginTextDecor(
                theColor: Colors.blueAccent,
                theText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                style: TextStyle(color: Colors.blueAccent),
                decoration: LoginTextDecor(
                    theText: 'Enter your password',
                    theColor: Colors.blueAccent)),
            SizedBox(
              height: 24.0,
            ),
            LoginButton(
              theText: "Register",
              theOnPressed: () {
                // Navigator.pushNamed(context, RegistrationScreen.id);
              },
              theColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
