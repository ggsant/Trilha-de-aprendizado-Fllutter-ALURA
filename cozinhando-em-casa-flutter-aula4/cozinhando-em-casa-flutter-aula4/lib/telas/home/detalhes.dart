import 'package:cozinhando_casa2/modelos/receita.dart';
import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  final Receita receita;
  Detalhes({Key key, @required this.receita}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _construirDetalhe();
  }

  Widget _construirDetalhe() {
    return Scaffold(
      appBar: _construirAppBar('Cozinhando em casa'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _construirImagemDetalhe(receita.foto),
            _construirTituloDetalhe(receita.titulo),
            _construirLinhaIconesDetalhe(
              '${receita.porcoes} porções',
              receita.tempoPreparo,
            ),
            _construirSubtituloDetalhes('Ingredientes'),
            _construirTextoDetalhe(receita.ingredientes),
            _construirSubtituloDetalhes('Detalhes'),
            _construirTextoDetalhe(receita.modoPreparo)
          ],
        ),
      ),
    );
  }

  Widget _construirTextoDetalhe(texto) {
    return Padding(padding: EdgeInsets.all(10), child: Text(texto));
  }

  Widget _construirLinhaIconesDetalhe(rendimento, tempoPreparo) {
    return Row(children: [
      _construirColunaIconesDetalhe(Icons.restaurant, rendimento),
      _construirColunaIconesDetalhe(Icons.timer, tempoPreparo),
    ]);
  }

  Widget _construirSubtituloDetalhes(subtitulo) {
    return Text(subtitulo,
        style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 20));
  }

  Widget _construirColunaIconesDetalhe(icon, text) {
    return Expanded(
      child: Column(children: [
        Icon(icon, color: Colors.deepOrange),
        Text(text,
            style: TextStyle(
                color: Colors.deepOrange, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _construirImagemDetalhe(imagem) {
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhe(titulo) {
    return Text(titulo,
        style: TextStyle(color: Colors.deepOrange, fontSize: 30));
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(title: Text(titulo));
  }
}
