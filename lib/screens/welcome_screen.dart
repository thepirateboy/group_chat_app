import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_chat_app/screens/login_screen.dart';
import 'package:group_chat_app/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:group_chat_app/items.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation animation1;

  @override
  void initState() {
    // TODO: implement initState

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      upperBound: 1, // 100,
    );

    // animation1 = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    animation1 =
        ColorTween(begin: Colors.blue, end: Colors.white).animate(controller);

    controller.forward();

    // animation1.addStatusListener((status) {
    //   // print(status);

    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      // print(animation1.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation1.value, //red.withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Icon(
                      FontAwesomeIcons.bolt,
                      color: Colors.amberAccent,
                      size: 100,
                    ),
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                SizedBox(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText("Flash Chat"),
                        TypewriterAnimatedText("Hey"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            LoginButton(
              theText: 'Login',
              theOnPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              theColor: Colors.lightBlueAccent,
            ),
            LoginButton(
              theText: "Register",
              theOnPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              theColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
