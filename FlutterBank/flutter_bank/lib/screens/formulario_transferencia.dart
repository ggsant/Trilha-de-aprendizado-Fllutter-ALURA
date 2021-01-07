import 'package:flutter/material.dart';
import 'package:flutter_bank/components/button.dart';
import 'package:flutter_bank/components/customLineForms.dart';
import 'package:flutter_bank/components/tituloAppBar.dart';
import 'package:flutter_bank/database/dao/transferencia_dao.dart';
import 'package:flutter_bank/model/transferencia.dart';

class FormsTransferencia extends StatefulWidget {
  @override
  _FormsTransferenciaState createState() => _FormsTransferenciaState();
}

class _FormsTransferenciaState extends State<FormsTransferencia> {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();
  final TextEditingController _controllerCpf = TextEditingController();

  final TransfDao _dao = TransfDao();

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
                controller: _controllerAccountNumber,
              ),
              SizedBox(height: 20),
              CustomLineForms(
                text: 'CPF',
                hintText: 'xxxxxxxxxx-x',
                icon: Icons.account_balance_wallet,
                controller: _controllerCpf,
                obscureText: false,
              ),
              SizedBox(height: 20),
              CustomLineForms(
                text: 'Valor',
                hintText: 'RS 00,00',
                icon: Icons.monetization_on,
                obscureText: false,
                controller: _controllerValue,
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
                onPressed: () {
                  final int accountNumber =
                      int.tryParse(_controllerAccountNumber.text);
                  final double value = double.tryParse(_controllerValue.text);
                  final int cpfNumber = int.tryParse(_controllerCpf.text);
                  final Transferencia newTransf =
                      Transferencia(0, value, cpfNumber, accountNumber);
                  print(
                      'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa $newTransf');
                  _dao.save(newTransf).then((id) => Navigator.pop(context));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // void _criaTransferencia(BuildContext context) {
  //   final int accountNumber = int.tryParse(_controllerNumConta.text);
  //   final double value = double.tryParse(_controllerValor.text);
  //   final int cpfNumber = int.tryParse(_controllerValor.text);

  //   if (accountNumber != null && value != null) {
  //     final newTransf = Transferencia(
  //       0,
  //       value,
  //       cpfNumber,
  //       accountNumber,
  //     );
  //     _dao.save(newTransf).then((id) => Navigator.pop(context));
  //   }
  // }
}
