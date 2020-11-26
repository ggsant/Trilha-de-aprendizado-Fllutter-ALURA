import 'package:bytebank_tranferencias/screens/widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../routes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                SizedBox(height: 100),
                Button(
                  text: 'Email',
                  onPressed: () {
                    Navigator.pushNamed(context, TransferScreenRoute);
                  },
                ),
                SizedBox(height: 10),
                Button(
                  text: 'Google',
                  onPressed: () {},
                ),
                SizedBox(height: 10),
                Button(
                  text: 'Aple',
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
