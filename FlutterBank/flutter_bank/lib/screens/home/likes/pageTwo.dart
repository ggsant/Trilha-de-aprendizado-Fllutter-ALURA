import 'package:flutter/material.dart';

class PageTwoMenu extends StatefulWidget {
  PageTwoMenu({Key key}) : super(key: key);
  @override
  _PageTwoMenuState createState() => _PageTwoMenuState();
}

class _PageTwoMenuState extends State<PageTwoMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 600,
      color: Colors.red,
    ));
  }
}
