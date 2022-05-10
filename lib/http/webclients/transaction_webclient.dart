import 'dart:convert';
import 'package:bytebank_oficial/http/webcliente.dart';
import 'package:bytebank_oficial/models/transaction.dart';
import 'package:http/http.dart';
import '../../models/contatos.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final response = await client.get(url).timeout(const Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction?> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(url,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);
    if (response.statusCode == 400) {
      throw Exception('Ocorreu um erro');
    }

    if (response.statusCode == 401) {
      throw Exception('Falha na autenticação!');
    }

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
