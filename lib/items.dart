import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  // const LoginButton({
  //   Key? key,
  // }) : super(key: key);

  late String theText;
  late VoidCallback theOnPressed;
  late Color theColor;

  LoginButton(
      {required this.theText,
      required this.theOnPressed,
      required this.theColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: theColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: theOnPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            theText,
          ),
        ),
      ),
    );
  }
}

InputDecoration LoginTextDecor(
    {required String theText, required Color theColor}) {
  return InputDecoration(
    hintStyle: TextStyle(color: theColor),
    hintText: theText,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}
