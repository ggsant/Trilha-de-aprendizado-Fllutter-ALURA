import 'package:flutter/material.dart';
import 'package:flutter_bank/model/transferencia.dart';

class CustomCard extends StatefulWidget {
  final Transferencia _transferencia;

  CustomCard(this._transferencia);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(
        Icons.monetization_on,
        color: Colors.green[200],
      ),
      title: Text('RS ${widget._transferencia.valor.toString()}'),
      subtitle: Text('${widget._transferencia.numeroConta.toString()}'),
    ));
  }
}
