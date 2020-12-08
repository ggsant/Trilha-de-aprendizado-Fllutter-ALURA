import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bank/screens/formulario_transferencia.dart';
import 'package:flutter_bank/screens/home/menu.dart';
import 'package:flutter_bank/screens/sign_in.dart';
import 'package:flutter_bank/screens/transferencia.dart';

const String SignInScreenRoute = '/';
const String MenuScreenRoute = '/menuScreenRoute';
const String TransferenciaScreenRoute = '/transferenciaScreenRoute';
const String FormsTransferenciaRoute = '/formsTransferenciaRoute';

MaterialPageRoute pushNewRoutes(String routeName) {
  WidgetBuilder screen;

  switch (routeName) {
    case SignInScreenRoute:
      screen = (BuildContext context) => SignInScreen();
      break;
    case MenuScreenRoute:
      screen = (BuildContext context) => MenuScreen(title: 'Flutter Bank');
      break;

    case FormsTransferenciaRoute:
      screen = (BuildContext context) => FormsTransferencia();
      break;

    case TransferenciaScreenRoute:
      screen = (BuildContext context) => TransferenciaScreen();
      break;

    default:
      screen = (BuildContext context) => SignInScreen();
      break;
  }

  return MaterialPageRoute(builder: screen);
}
