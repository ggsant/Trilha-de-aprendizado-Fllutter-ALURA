import 'package:flutter/material.dart';
import 'package:flutter_bank/model/transferencia.dart';

class CustomCard extends StatelessWidget {
  CustomCard(this.transferencia);
  final Transferencia transferencia;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(
        Icons.monetization_on,
        color: Colors.green[200],
      ),
      title: Text('RS ${transferencia.toStringValor()}'),
      subtitle: Text('${transferencia.toStringConta()}'),
    ));
  }
}
