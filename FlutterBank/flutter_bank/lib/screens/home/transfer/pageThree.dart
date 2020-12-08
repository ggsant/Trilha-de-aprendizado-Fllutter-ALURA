import 'package:flutter/material.dart';
import 'package:flutter_bank/components/listaDeTransferencias.dart';
import 'package:flutter_bank/components/title.dart';
import 'package:flutter_bank/model/transferencia.dart';

import '../../formulario_transferencia.dart';

class PageThreeMenu extends StatefulWidget {
  PageThreeMenu({Key key}) : super(key: key);
  final List<Transferencia> listaTransferencias = List();

  @override
  _PageThreeMenuState createState() => _PageThreeMenuState();
}

class _PageThreeMenuState extends State<PageThreeMenu> {
  final List<Transferencia> listaTransferencias = List();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.listaTransferencias.isEmpty
            ? Center(
                child: TitleFont(
                  text: 'Faça uma nova transferência!',
                  fontSize: 30,
                ),
              )
            : ListView.builder(
                itemCount: widget.listaTransferencias.length,
                itemBuilder: (context, index) {
                  final transferencia = widget.listaTransferencias[index];
                  return CustomCard(transferencia);
                }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(83, 109, 254, 1),
          heroTag: "btn1",
          child: Icon(Icons.add),
          onPressed: () {
            final Future<Transferencia> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormsTransferencia();
            }));
            future.then(
              (transferenciaRecebida) {
                Future.delayed(
                  Duration(seconds: 1),
                  () {
                    if (transferenciaRecebida != null) {
                      setState(() {
                        widget.listaTransferencias.add(transferenciaRecebida);
                      });
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
