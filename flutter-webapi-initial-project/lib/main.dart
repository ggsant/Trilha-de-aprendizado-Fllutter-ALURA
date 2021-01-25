import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'components/theme.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: bytebankTheme,
      home: Dashboard(),
    );
  }
}
