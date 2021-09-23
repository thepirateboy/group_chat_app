import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_chat_app/items.dart';
import 'package:group_chat_app/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Container(
                      height: 200.0,
                      child: Icon(
                        FontAwesomeIcons.bolt,
                        color: Colors.amberAccent,
                        size: 150,
                      )),
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
                style: TextStyle(color: Colors.lightBlueAccent),
                decoration: LoginTextDecor(
                  theText: 'Enter your email',
                  theColor: Colors.lightBlueAccent,
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
                theOnPressed: () async {
                  // Navigator.pushNamed(context, LoginScreen.id);
                  try {
                    setState(() {
                      showSpinner = true;
                    });
                    print("\nEmail= $email \nPassword = $password");
                    final loginUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    // print(loginUser);
                    if (loginUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    print("ERROR CATCH \n $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                        backgroundColor: Colors.pink,
                        action: SnackBarAction(
                          label: "OK",
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                },
                theColor: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
