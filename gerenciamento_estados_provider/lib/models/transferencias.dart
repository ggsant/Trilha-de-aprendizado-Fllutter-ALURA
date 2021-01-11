import 'package:flutter/material.dart';
import 'package:gerenciamento_estados_provider/models/transferencia.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencia = [];

  List<Transferencia> get transferencias => _transferencia;

  adiciona(Transferencia newTransferencia) {
    transferencias.add(newTransferencia);

    notifyListeners();
  }
}
