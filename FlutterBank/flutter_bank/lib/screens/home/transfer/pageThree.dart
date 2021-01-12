import 'package:flutter/material.dart';
import 'package:flutter_bank/components/buttonsDashboard.dart';
import 'package:flutter_bank/components/saldoCard.dart';
import 'package:flutter_bank/components/title.dart';
import 'package:flutter_bank/database/dao/transferencia_dao.dart';
import 'package:flutter_bank/model/transferencia.dart';
import 'package:flutter_bank/screens/home/notifications/listaMovimentacoes.dart';
import 'package:flutter_bank/screens/home/transfer/ultimasTransferencias.dart';

import 'formularioDeposito.dart';
import 'formulario_transferencia.dart';

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

                if (transf != null) {
                  return ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SaldoCard(),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          ButtonDashboard(
                            text: 'Receber depósito',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FormularioDeposito();
                              }));
                            },
                          ),
                          ButtonDashboard(
                            text: 'Fazer transferência',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FormsTransferencia(); //
                              }));
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: ButtonDashboard(
                          text: 'Extrato bancário',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ListaMovimentacoes(); //
                            }));
                          },
                        ),
                      ),
                      UltimasTransferencias()
                    ],
                  );
                } else {
                  return Center(
                    child: TitleFont(
                      text: 'Faça uma nova transferência!',
                      fontSize: 30,
                    ),
                  );
                }
                break;
            }
            return Text('Error');
          },
        ),
      ),
    );
  }
}

// floatingActionButton: FloatingActionButton(
//   backgroundColor: Color.fromRGBO(83, 109, 254, 1),
//   heroTag: "btn1",
//   child: Icon(Icons.add),
//   onPressed: () {
//     Navigator.of(context)
//         .push(MaterialPageRoute(
//       builder: (context) => FormsTransferencia(),
//     ))
//         .then((value) {
//       setState(() {
//         widget.createState();
//       });
//     });
//   },
// ),
