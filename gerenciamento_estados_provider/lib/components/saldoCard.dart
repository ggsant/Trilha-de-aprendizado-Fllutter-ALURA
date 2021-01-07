import 'package:flutter/material.dart';
import 'package:gerenciamento_estados_provider/models/saldo.dart';

class SaldoCard extends StatelessWidget {
  SaldoCard({this.saldo});
  final Saldo saldo;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          saldo.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
