import 'package:bytebank_tranferencias/components/listaDeTransferencias.dart';
import 'package:bytebank_tranferencias/model/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario_transferencia.dart';

class TransferenciaScreen extends StatefulWidget {
  TransferenciaScreen({Key key}) : super(key: key);
  final List<Transferencia> listaTransferencias = List();

  @override
  _TransferenciaScreenState createState() => _TransferenciaScreenState();
}

class _TransferenciaScreenState extends State<TransferenciaScreen> {
  final List<Transferencia> listaTransferencias = List();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[800],
        body: ListView.builder(
            itemCount: widget.listaTransferencias.length,
            itemBuilder: (context, index) {
              final transferencia = widget.listaTransferencias[index];
              return CustomCard(transferencia);
            }),
        floatingActionButton: FloatingActionButton(
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
