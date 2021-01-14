import 'package:flutter/material.dart';
import 'package:flutter_bank/model/saldo.dart';
import 'package:flutter_bank/resources/strings.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {
  SaldoCard({this.saldo});
  final Saldo saldo;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Consumer<Saldo>(
        builder: (context, valor, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  Strings.currentBalance,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  valor.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
