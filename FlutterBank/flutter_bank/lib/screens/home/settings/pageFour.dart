import 'package:flutter/material.dart';

class PageFourMenu extends StatefulWidget {
  @override
  _PageFourMenuState createState() => _PageFourMenuState();
}

class _PageFourMenuState extends State<PageFourMenu> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 600,
      color: Colors.pink,
    ));
  }
}
