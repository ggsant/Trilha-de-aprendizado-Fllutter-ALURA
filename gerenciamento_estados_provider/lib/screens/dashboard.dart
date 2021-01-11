import 'package:flutter/material.dart';
import 'package:gerenciamento_estados_provider/components/saldoCard.dart';
import 'package:gerenciamento_estados_provider/screens/transferencia/formulario.dart';

import 'deposito/formulario.dart';
import 'extrato/lista.dart';
import 'extrato/ultimas.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Receber depósito'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioDeposito();
                  }));
                },
              ),
              RaisedButton(
                child: Text('Fazer transferencia'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioTransferencia(); //
                  }));
                },
              ),
            ],
          ),
          RaisedButton(
            child: Text('Transferencia'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListaMovimentacoes(); //
              }));
            },
          ),
          UltimasTransferencias()
        ],
      ),
    );
  }
}
