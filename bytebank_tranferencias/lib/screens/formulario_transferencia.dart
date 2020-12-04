import 'package:bytebank_tranferencias/screens/widgets/button.dart';
import 'package:flutter/material.dart';

import 'widgets/customLineForms.dart';
import 'widgets/tituloAppBar.dart';

class FormularioTransferenciaScreen extends StatefulWidget {
  @override
  _FormularioTransferenciaScreenState createState() =>
      _FormularioTransferenciaScreenState();
}

class _FormularioTransferenciaScreenState
    extends State<FormularioTransferenciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(title: 'Nova transferência'),
      ),
      body: Column(
        children: [
          CustomLineForms(),
          SizedBox(height: 20),
          Button(text: 'Transferir', onPressed: () {})
        ],
      ),
    );
  }
}
