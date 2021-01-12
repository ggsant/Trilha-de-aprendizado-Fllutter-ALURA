import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
        body: SizedBox(
            height: 270,
            child: _construirCard()
        ),
        appBar: _construirAppBar('Cozinhando em Casa')
    );
  }

  Widget _construirCard() {
    return Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                _construirImagemCard('https://receitas.carolecrema.com.br/wp-content/uploads/2018/10/shutterstock_662262010-848x477.jpg'),
                _construirTituloCard('Bolo de Milho')
              ],
            ),
          ],
        )
    );
  }

  Widget _construirImagemCard(String imagem) {
    return Image.network(imagem,
        fit: BoxFit.fill,
        height: 238);
  }

  Widget _construirTituloCard(String titulo) {
    return Positioned(
        bottom: 10.0,
        left: 10.0,
        child: Text(titulo, style: TextStyle(fontSize: 20))
    );
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(title: Text(titulo));
  }

}
