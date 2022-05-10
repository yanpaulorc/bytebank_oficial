import 'package:bytebank_oficial/database/app_database.dart';
import 'package:bytebank_oficial/models/contatos.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDao {
  static const String _nomeTabela = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numero_conta';

  static const String tabelaSql = 'CREATE TABLE $_nomeTabela('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_numeroConta INTEGER)';

  Future<int> save(Contatos contato) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contatoMap = _toMap(contato);
    return db.insert(_nomeTabela, contatoMap);
  }

  Map<String, dynamic> _toMap(Contatos contato) {
    final Map<String, dynamic> contatoMap = {}; //map()
    contatoMap[_nome] = contato.nome;
    contatoMap[_numeroConta] = contato.numeroConta;
    return contatoMap;
  }

  Future<List<Contatos>> buscaTodos() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_nomeTabela);
    List<Contatos> contatos = _toList(resultado);
    return contatos;
  }

  List<Contatos> _toList(List<Map<String, dynamic>> resultado) {
    final List<Contatos> contatos = [];
    for (Map<String, dynamic> row in resultado) {
      final Contatos contato = Contatos(
        row[_id],
        row[_nome],
        row[_numeroConta],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}
