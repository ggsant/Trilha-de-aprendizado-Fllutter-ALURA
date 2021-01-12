import 'package:flutter/material.dart';
import 'package:flutter_bank/components/buttonsDashboard.dart';
import 'package:flutter_bank/components/editor.dart';
import 'package:flutter_bank/components/saldoCard.dart';
import 'package:flutter_bank/components/tituloAppBar.dart';
import 'package:flutter_bank/database/dao/transferencia_dao.dart';
import 'package:flutter_bank/model/saldo.dart';
import 'package:flutter_bank/model/transferencia.dart';
import 'package:flutter_bank/model/transferencias.dart';
import 'package:provider/provider.dart';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormsTransferencia extends StatefulWidget {
  @override
  _FormsTransferenciaState createState() => _FormsTransferenciaState();
}

class _FormsTransferenciaState extends State<FormsTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  final TransfDao _dao = TransfDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(title: 'Nova transferência'),
        backgroundColor: Color.fromRGBO(83, 109, 254, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: SaldoCard(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Editor(
                      controlador: _controladorCampoNumeroConta,
                      dica: _dicaCampoNumeroConta,
                      rotulo: _rotuloCampoNumeroConta,
                    ),
                    Editor(
                      dica: _dicaCampoValor,
                      controlador: _controladorCampoValor,
                      rotulo: _rotuloCampoValor,
                      icone: Icons.monetization_on,
                    ),
                    ButtonDashboard(
                      text: _textoBotaoConfirmar,
                      onPressed: () => _criaTransferencia(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    final transferenciaValida =
        _validaTransferencia(context, numeroConta, valor);

    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor, numeroConta);
      _atualizaEstado(context, novaTransferencia, valor);
      _dao.save(novaTransferencia).then((id) => Navigator.pop(context));
    }
  }

  _validaTransferencia(context, numeroConta, valor) {
    final _camposPreenchidos = numeroConta != null && valor != null;
    final _saldoSuficiente =
        valor <= Provider.of<Saldo>(context, listen: false).valor;

    return _camposPreenchidos && _saldoSuficiente;
  }

  _atualizaEstado(context, novaTransferencia, valor) {
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).subtrai(valor);
  }
}
