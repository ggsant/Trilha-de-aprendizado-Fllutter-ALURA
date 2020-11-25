import 'package:bytebank_tranferencias/routes.dart';
import 'package:bytebank_tranferencias/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bytebank());
}

class Bytebank extends StatefulWidget {
  @override
  _BytebankState createState() => _BytebankState();
}

class _BytebankState extends State<Bytebank> {
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails details) => Container(
          color: Colors.pink,
          child: Text(
            'Deu erro 😥',
            style: TextStyle(color: Colors.white),
          ),
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ByteBank',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(),
      onGenerateRoute: routes(),
    );
  }
}
