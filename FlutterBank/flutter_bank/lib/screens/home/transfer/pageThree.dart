import 'package:flutter/material.dart';
import 'package:flutter_bank/components/listaDeTransferencias.dart';
import 'package:flutter_bank/components/title.dart';
import 'package:flutter_bank/database/dao/transferencia_dao.dart';
import 'package:flutter_bank/model/transferencia.dart';

import '../../formulario_transferencia.dart';

class PageThreeMenu extends StatefulWidget {
  @override
  _PageThreeMenuState createState() => _PageThreeMenuState();
}

class _PageThreeMenuState extends State<PageThreeMenu> {
  @override
  Widget build(BuildContext context) {
    final TransfDao _dao = TransfDao();

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<Transferencia>>(
          initialData: List(),
          future: Future.delayed(Duration(seconds: 1))
              .then((value) => _dao.findAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.blue),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Transferencia> transf = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Transferencia transferencia = transf[index];
                    return CustomCard(transferencia);
                  },
                  itemCount: transf.length,
                );
                // if (transf != null) {
                //   return ListView.builder(
                //     itemBuilder: (context, index) {
                //       final Transferencia transferencia = transf[index];
                //       return CustomCard(transferencia);
                //     },
                //     itemCount: transf.length,
                //   );
                // } else {
                //   return Center(
                //     child: TitleFont(
                //       text: 'Faça uma nova transferência!',
                //       fontSize: 30,
                //     ),
                //   );
                // }

                break;
            }
            return Text('Error');
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(83, 109, 254, 1),
          heroTag: "btn1",
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => FormsTransferencia(),
            ))
                .then((value) {
              setState(() {
                widget.createState();
              });
            });
          },
          // onPressed: () {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => FormsTransferencia(),
          //     ),
          //   );
          // },
          // onPressed: () {
          //   final Future<Transferencia> future =
          //       Navigator.push(context, MaterialPageRoute(builder: (context) {
          //     return FormsTransferencia();
          //   }));
          //   future.then(
          //     (transferenciaRecebida) {
          //       Future.delayed(
          //         Duration(seconds: 1),
          //         () {
          //           if (transferenciaRecebida != null) {
          //             setState(() {
          //               transferenciaRecebida.add(transferenciaRecebida);
          //             });
          //           }
          //         },
          //       );
          //     },
          //   );
          // },
        ),
      ),
    );
  }
}
