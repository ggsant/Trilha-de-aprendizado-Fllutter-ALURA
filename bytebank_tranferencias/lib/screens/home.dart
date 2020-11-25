import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Column(
            children: [
              Text(
                'Seja bem vindo ao Bytebank',
                textDirection: TextDirection.ltr,
              )
            ],
          ),
        ));
  }
}
