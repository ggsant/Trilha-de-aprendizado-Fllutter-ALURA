import 'package:flutter/material.dart';

class ButtonDashboard extends StatelessWidget {
  ButtonDashboard({this.text, this.onPressed});
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: Color.fromRGBO(83, 109, 254, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
      onPressed: onPressed,
    );
  }
}
