import 'package:bytebank_tranferencias/screens/widgets/lista_de_transf.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen({Key key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Transferências'),
              SizedBox(width: 10),
              Column(
                children: [
                  Image.asset(
                    'assets/logo2.png',
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    'Flutter Bank',
                    style: GoogleFonts.kaushanScript(
                      textStyle: TextStyle(
                        color: Colors.green[200],
                        fontSize: 10,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.indigo[600],
        ),
        backgroundColor: Colors.indigo[800],
        body: ListaDeTransferencias(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
