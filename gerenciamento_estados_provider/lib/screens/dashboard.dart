import 'package:flutter/material.dart';
import 'package:gerenciamento_estados_provider/components/saldoCard.dart';
import 'package:gerenciamento_estados_provider/models/saldo.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SaldoCard(saldo: Saldo(30.50)),
      ),
    );
  }
}
