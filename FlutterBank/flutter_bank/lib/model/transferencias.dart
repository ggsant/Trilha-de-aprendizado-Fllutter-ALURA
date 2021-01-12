import 'package:flutter/material.dart';
import 'package:flutter_bank/model/transferencia.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencia = [];

  List<Transferencia> get transferencias => _transferencia;

  adiciona(Transferencia newTransferencia) {
    transferencias.add(newTransferencia);

    notifyListeners();
  }
}
