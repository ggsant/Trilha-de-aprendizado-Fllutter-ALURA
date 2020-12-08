import 'package:flutter/material.dart';
import 'package:flutter_bank/resources/routes.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.indigo[800],
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Image.asset(
                  'assets/logo2.png',
                  height: 150,
                  width: 150,
                ),
                Text(
                  'Flutter Bank',
                  style: GoogleFonts.kaushanScript(
                    textStyle: TextStyle(
                      color: Colors.green[200],
                      fontSize: 60,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                SignInButtonBuilder(
                  text: 'Get going with Email',
                  icon: Icons.email,
                  width: 220.0,
                  backgroundColor: Colors.blueGrey[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  onPressed: () {
                    Navigator.push(context, pushNewRoutes(MenuScreenRoute));
                  },
                ),
                Divider(),
                SignInButton(
                  Buttons.FacebookNew,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  onPressed: () {
                    Navigator.push(context, pushNewRoutes(MenuScreenRoute));
                  },
                ),
                Divider(),
                SignInButton(
                  Buttons.Apple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  onPressed: () {
                    Navigator.push(context, pushNewRoutes(MenuScreenRoute));
                  },
                ),
              ],
            ),
          )),
    );
  }
}
