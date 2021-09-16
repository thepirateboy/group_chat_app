import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    home: GroupChatApp(),
  ));
}

class GroupChatApp extends StatelessWidget {
  // const GroupChatApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
      ),
    );
  }
}
