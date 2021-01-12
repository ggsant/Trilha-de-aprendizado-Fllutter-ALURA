import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bank/model/transferencias.dart';
import 'package:flutter_bank/screens/home/notifications/item.dart';
import 'package:flutter_bank/screens/home/notifications/listaMovimentacoes.dart';
import 'package:provider/provider.dart';

final _titulo = 'Últimas transferências';
final _conteudoBotao = 'Visualizar todas';

class UltimasTransferencias extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final _ultimasTransferencias =
                transferencias.transferencias.reversed.toList();
            final _quantidade = transferencias.transferencias.length;
            int tamanho;

            if (_quantidade < 3) {
              tamanho = _quantidade;
            } else {
              tamanho = 2;
            }

            if (_quantidade == 0) {
              return Card(
                margin: EdgeInsets.all(40),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Você ainda não tem nenhuma transferência cadastrada',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: tamanho,
              itemBuilder: (context, indice) {
                final _transferencia = _ultimasTransferencias[indice];
                final _valor = _transferencia.toStringValor();
                final _conta = _transferencia.toStringConta();

                return Item.transferencia(_valor, _conta);
              },
            );
          },
        ),
        FlatButton(
          color: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListaMovimentacoes();
              }),
            );
          },
          child: Text(_conteudoBotao),
        )
      ],
    );
  }
}
