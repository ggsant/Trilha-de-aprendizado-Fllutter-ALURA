import 'package:bytebank_tranferencias/screens/formulario_transferencia.dart';
import 'package:bytebank_tranferencias/screens/home.dart';
import 'package:bytebank_tranferencias/screens/sign_in.dart';
import 'package:flutter/material.dart';

const String SignInScreenRoute = '/';
const String HomeScreenRoute = '/tranferRoute';
const String FormsScreenRoute = '/formsRoute';

RouteFactory routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;

    Widget screen;
    switch (settings.name) {
      case SignInScreenRoute:
        screen = SignInScreen();
        break;
      case HomeScreenRoute:
        screen = HomeScreen();
        break;
      case FormsScreenRoute:
        screen = FormularioTransferenciaScreen();
        break;

      default:
        screen = HomeScreen();
        break;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
