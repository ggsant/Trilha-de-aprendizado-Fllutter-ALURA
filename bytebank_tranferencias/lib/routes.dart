import 'package:bytebank_tranferencias/screens/home.dart';
import 'package:flutter/material.dart';

const String HomeScreenRoute = '/';

RouteFactory routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;

    Widget screen;
    switch (settings.name) {
      case HomeScreenRoute:
        screen = HomeScreen();
        break;

      default:
        screen = HomeScreen();
        break;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
