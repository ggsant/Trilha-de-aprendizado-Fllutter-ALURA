import 'package:flutter/material.dart';
import 'package:flutter_bank/screens/sign_in.dart';
import 'package:provider/provider.dart';

import 'model/saldo.dart';
import 'model/transferencias.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Saldo(0),
          ),
          ChangeNotifierProvider(
            create: (context) => Transferencias(),
          )
        ],
        child: FlutterBank(),
      ),
    );

class FlutterBank extends StatelessWidget {
  const FlutterBank({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails details) => Container(
          color: Colors.pinkAccent,
          child: Text(
            'Deu erro 😥',
            style: TextStyle(color: Colors.white),
          ),
        );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterBank',
      color: Color.fromRGBO(231, 72, 154, 1),
      home: SignInScreen(),
    );
  }
}
