import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/sign_in.dart';

const String SignInScreenRoute = '/';
const String HomeScreenRoute = '/tranferRoute';

RouteFactory routes() {
  return (settings) {
    Widget screen;
    switch (settings.name) {
      case SignInScreenRoute:
        screen = SignInScreen();
        break;
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
