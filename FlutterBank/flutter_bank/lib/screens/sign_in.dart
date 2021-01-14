import 'package:flutter/material.dart';
import 'package:flutter_bank/resources/routes.dart';
import 'package:flutter_bank/resources/strings.dart';
import 'package:flutter_bank/resources/theme_colors.dart';
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
          backgroundColor: ThemeColors.indigo800Color,
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Image.asset(
                  Strings.imageLogo,
                  height: 150,
                  width: 150,
                ),
                Text(
                  Strings.title,
                  style: GoogleFonts.kaushanScript(
                    textStyle: TextStyle(
                      color: ThemeColors.green200Color,
                      fontSize: 60,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                SignInButtonBuilder(
                  text: Strings.signInWithEmail,
                  icon: Icons.email,
                  width: 220.0,
                  backgroundColor: ThemeColors.blueGrey700Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  onPressed: () {
                    _signIn(context);
                  },
                ),
                Divider(),
                SignInButton(
                  Buttons.FacebookNew,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  onPressed: () {
                    _signIn(context);
                  },
                ),
                Divider(),
                SignInButton(
                  Buttons.Apple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  onPressed: () {
                    _signIn(context);
                  },
                ),
              ],
            ),
          )),
    );
  }

  void _signIn(BuildContext context) {
    Navigator.push(context, pushNewRoutes(MenuScreenRoute));
  }
}
