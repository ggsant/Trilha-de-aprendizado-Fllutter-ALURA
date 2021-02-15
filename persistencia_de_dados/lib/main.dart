import 'package:flutter/material.dart';
import 'package:persistencia_internacionalizacao/model/contact.dart';
import 'package:persistencia_internacionalizacao/database/database.dart';
import 'screens/sign_in.dart';

void main() {
  runApp(Bytebank());
  save(Contact(0, 'Gabriela', 1000)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
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
      title: 'Flutter Bank',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SignInScreen(),
    );
  }
}
