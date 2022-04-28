import 'package:bytebank_oficial/database/dao/contato_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDao.tabelaSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}
