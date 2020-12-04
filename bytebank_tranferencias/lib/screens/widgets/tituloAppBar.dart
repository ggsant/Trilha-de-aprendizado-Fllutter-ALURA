import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo2.png',
          height: 20,
          width: 20,
        ),
        Text(
          'Flutter Bank',
          style: GoogleFonts.kaushanScript(
            textStyle: TextStyle(
              color: Colors.green[200],
              fontSize: 10,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class TitleAppBar extends StatelessWidget {
  TitleAppBar({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        SizedBox(width: 10),
        IconAppBar(),
      ],
    );
  }
}
