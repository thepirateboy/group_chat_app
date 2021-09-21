import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_chat_app/items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:group_chat_app/screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

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
            // todo: EMAIL TEXTFIELD
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
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
            // todo: PASSWORD TEXTFIELD
            TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
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
              theOnPressed: () async {
                // Navigator.pushNamed(context, RegistrationScreen.id);
                print("username = $email \npassword = $password");
                try {
                  print("1");
                  final newUSer = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  print(2);
                  if (newUSer != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } on Exception catch (e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                      backgroundColor: Colors.blueAccent,
                      action: SnackBarAction(
                        label: "OK",
                        onPressed: () {},
                      ),
                    ),
                  );
                }
              },
              theColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
