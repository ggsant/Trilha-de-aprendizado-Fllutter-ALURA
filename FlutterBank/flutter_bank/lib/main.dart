import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bank/screens/sign_in.dart';
import 'package:provider/provider.dart';

import 'model/saldo.dart';
import 'model/transferencias.dart';
import 'resources/strings.dart';
import 'resources/theme_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ThemeColors.indigo800Color,
    statusBarColor: ThemeColors.indigo800Color,
  ));
  runApp(
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
}

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
      title: Strings.title,
      home: SignInScreen(),
    );
  }
}
