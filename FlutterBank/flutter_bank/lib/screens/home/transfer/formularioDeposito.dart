import 'package:flutter/material.dart';
import 'package:flutter_bank/components/buttonsDashboard.dart';
import 'package:flutter_bank/components/editor.dart';
import 'package:flutter_bank/components/saldoCard.dart';
import 'package:flutter_bank/database/dao/saldo_dao.dart';
import 'package:flutter_bank/model/saldo.dart';
import 'package:flutter_bank/resources/theme_colors.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Receber depósio';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatefulWidget {
  @override
  _FormularioDepositoState createState() => _FormularioDepositoState();
}

class _FormularioDepositoState extends State<FormularioDeposito> {
  final TextEditingController _controladorCampoValor = TextEditingController();
  final SaldoDao _dao = SaldoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
          backgroundColor: ThemeColors.indigo800Color,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SaldoCard(),
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Editor(
                      dica: _dicaCampoValor,
                      controlador: _controladorCampoValor,
                      rotulo: _rotuloCampoValor,
                      icone: Icons.monetization_on,
                    ),
                    ButtonDashboard(
                      text: _textoBotaoConfirmar,
                      onPressed: () => _criaDeposito(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _criaDeposito(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final Saldo newSaldo = Saldo(valor);
    final depositoValido = _validaDeposito(valor);
    if (depositoValido) {
      _atualizaEstado(context, valor);
      _dao.save(newSaldo).then((id) => Navigator.pop(context));
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
