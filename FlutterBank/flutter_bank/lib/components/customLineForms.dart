import 'package:flutter/material.dart';

class CustomLineForms extends StatelessWidget {
  CustomLineForms(
      {this.text, this.hintText, this.icon, this.obscureText, this.controller});
  final String text;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Color.fromRGBO(83, 109, 254, 1),
        ),
        labelText: text,
        hintText: hintText,
      ),
    );
  }
}
