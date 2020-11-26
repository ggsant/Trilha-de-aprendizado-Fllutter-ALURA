import 'package:bytebank_tranferencias/screens/home.dart';
import 'package:bytebank_tranferencias/screens/transfer.dart';
import 'package:flutter/material.dart';

const String HomeScreenRoute = '/';
const String TransferScreenRoute = '/tranferRoute';

RouteFactory routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;

    Widget screen;
    switch (settings.name) {
      case HomeScreenRoute:
        screen = HomeScreen();
        break;
      case TransferScreenRoute:
        screen = TransferScreen();
        break;

      default:
        screen = HomeScreen();
        break;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
