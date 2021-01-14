import 'package:flutter/material.dart';

class ThemeColors {
  static const Color primaryTextColor = Colors.black;
  static const Color secondaryTextColor = Colors.white;
  static Color primaryColor = HexColor('#536DFE');
  static Color indigo800Color = Colors.indigo[800];
  static Color green200Color = Colors.green[200];
  static Color blueGrey700Color = Colors.blueGrey[700];
  static const Color whiteColor = Colors.white;
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
