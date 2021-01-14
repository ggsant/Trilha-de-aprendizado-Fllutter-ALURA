import 'package:flutter/material.dart';
import 'package:flutter_bank/model/transferencias.dart';
import 'package:provider/provider.dart';

import 'item.dart';

class PageOneMenu extends StatefulWidget {
  @override
  _PageOneMenuState createState() => _PageOneMenuState();
}

class _PageOneMenuState extends State<PageOneMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Transferencias>(
        builder: (context, transferencias, child) {
          if (transferencias.transferencias.length > 0) {
            return ListView.builder(
              itemCount: transferencias.transferencias.length,
              itemBuilder: (context, indice) {
                final transferencia = transferencias.transferencias[indice];

                return Item.transferencia(
                  transferencia.toStringValor(),
                  transferencia.toStringConta(),
                  transferencia.toStringNome(),
                );
              },
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(top: 180.0),
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(40),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Você ainda não tem nenhuma transferência cadastrada',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
