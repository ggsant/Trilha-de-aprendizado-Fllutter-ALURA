import 'package:flutter_bank/model/saldo.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

class SaldoDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_saldo DOUBLE, )';

  static const String _id = 'id';
  static const String _saldo = 'saldo';
  static const String _tableName = 'saldoConta';

  Future<int> save(Saldo saldo) async {
    final Database db = await getDatabase();
    Map<String, dynamic> saldoMap = _toMap(saldo);
    return db.insert(_tableName, saldoMap);
  }

  Map<String, dynamic> _toMap(Saldo saldo) {
    final Map<String, dynamic> saldoMap = Map();
    saldoMap[_saldo] = saldo.valor;

    return saldoMap;
  }

  // Future<List<Saldo>> findAll() async {
  //   final Database db = await getDatabase();
  //   final List<Map<String, dynamic>> result = await db.query(_tableName);
  //   List<Saldo> saldos = _toList(result);
  //   return saldos;
  // }

  // List<Saldo> _toList(List<Map<String, dynamic>> result) {
  //   final List<Saldo> saldos = List();
  //   for (Map<String, dynamic> row in result) {
  //     final Saldo saldo = Saldo(
  //       row[_saldo],
  //     );
  //     saldos.add(saldo);
  //   }
  //   return saldos;
  // }
}
