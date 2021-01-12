import 'package:flutter/material.dart';
import 'package:flutter_bank/model/saldo.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {
  SaldoCard({this.saldo});
  final Saldo saldo;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Consumer<Saldo>(
          builder: (context, valor, child) {
            return Text(
              valor.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
