import 'package:flutter/material.dart';
import 'package:flutter_bank/components/editor.dart';
import 'package:flutter_bank/model/saldo.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Receber depósio';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaDeposito(context),
              ),
            ],
          ),
        ));
  }

  void _criaDeposito(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(valor);
    if (depositoValido) {
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  _validaDeposito(valor) {
    final _campoPreenchido = valor != null;
    return _campoPreenchido;
  }

  _atualizaEstado(context, valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
