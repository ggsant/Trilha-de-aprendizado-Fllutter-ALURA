import 'package:flutter_bank/model/transferencia.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

class TransfDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_cpfNumber INTEGER, '
      '$_accountNumber INTEGER, $_value DOUBLE)';

  static const String _id = 'id';
  static const String _value = 'value';
  static const String _tableName = 'transferencias';
  static const String _cpfNumber = 'cpf_number';
  static const String _accountNumber = 'account_number';

  Future<int> save(Transferencia transf) async {
    final Database db = await getDatabase();
    Map<String, dynamic> transfMap = _toMap(transf);
    return db.insert(_tableName, transfMap);
  }

  Map<String, dynamic> _toMap(Transferencia transf) {
    final Map<String, dynamic> transfMap = Map();
    transfMap[_value] = transf.valor;
    transfMap[_accountNumber] = transf.numeroConta;

    return transfMap;
  }

  Future<List<Transferencia>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Transferencia> transfs = _toList(result);
    return transfs;
  }

  List<Transferencia> _toList(List<Map<String, dynamic>> result) {
    final List<Transferencia> transfs = List();
    for (Map<String, dynamic> row in result) {
      final Transferencia transf = Transferencia(
        // row[_id],
        row[_value],
        row[_accountNumber],
      );
      transfs.add(transf);
    }
    return transfs;
  }
}
