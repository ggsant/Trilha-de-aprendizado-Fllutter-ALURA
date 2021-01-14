import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/transferencia_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TransfDao.tableSql);
    },
    version: 3,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
