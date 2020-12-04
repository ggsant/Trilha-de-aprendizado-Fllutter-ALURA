import 'package:flutter/material.dart';

import '../routes.dart';
import 'widgets/listaDeTransferencias.dart';
import 'widgets/tituloAppBar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TitleAppBar(title: 'Transferências'),
          backgroundColor: Colors.indigo[600],
        ),
        backgroundColor: Colors.indigo[800],
        body: ListaDeTransferencias(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, FormsScreenRoute);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
