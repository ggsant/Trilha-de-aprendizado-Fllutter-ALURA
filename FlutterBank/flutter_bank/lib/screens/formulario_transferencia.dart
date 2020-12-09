import 'package:flutter/material.dart';
import 'package:flutter_bank/components/button.dart';
import 'package:flutter_bank/components/customLineForms.dart';
import 'package:flutter_bank/components/tituloAppBar.dart';
import 'package:flutter_bank/model/transferencia.dart';

class FormsTransferencia extends StatefulWidget {
  @override
  _FormsTransferenciaState createState() => _FormsTransferenciaState();
}

class _FormsTransferenciaState extends State<FormsTransferencia> {
  final TextEditingController _controllerNumConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(title: 'Nova transferência'),
        backgroundColor: Color.fromRGBO(83, 109, 254, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomLineForms(
                  text: 'Número da conta',
                  hintText: 'xxxxxxxx-xx',
                  icon: Icons.account_balance_wallet,
                  obscureText: false,
                  controller: _controllerNumConta),
              SizedBox(height: 20),
              CustomLineForms(
                text: 'CPF',
                hintText: 'xxxxxxxxxx-x',
                icon: Icons.account_balance_wallet,
                obscureText: false,
              ),
              SizedBox(height: 20),
              CustomLineForms(
                text: 'Valor',
                hintText: 'RS 00,00',
                icon: Icons.monetization_on,
                obscureText: false,
                controller: _controllerValor,
              ),
              SizedBox(height: 20),
              CustomLineForms(
                text: 'Senha',
                hintText: 'xxxxxxxxxx',
                icon: Icons.account_balance_wallet,
                obscureText: false,
              ),
              SizedBox(height: 20),
              Button(
                text: 'Transferir',
                onPressed: () => _criaTransferencia(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controllerNumConta.text);
    final double valor = double.tryParse(_controllerValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
