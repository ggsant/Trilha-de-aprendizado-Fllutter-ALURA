import 'package:flutter/material.dart';

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

class CustomCard extends StatelessWidget {
  final Transferencia _transferencia;

  CustomCard(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(
        Icons.monetization_on,
        color: Colors.green[200],
      ),
      title: Text('RS ${_transferencia.valor.toString()}'),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class ListaDeTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(Transferencia(100.0, 785612)),
        CustomCard(Transferencia(460.0, 567816)),
        CustomCard(Transferencia(683.0, 238167)),
        CustomCard(Transferencia(869.0, 193746)),
        CustomCard(Transferencia(352.0, 190578)),
      ],
    );
  }
}
