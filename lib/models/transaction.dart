import 'package:bytebank_oficial/models/contatos.dart';

class Transaction {
  final double value;
  final Contatos contato;

  Transaction(
    this.value,
    this.contato,
  );

  Transaction.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        contato = Contatos.fromJson(json['contact']);

  Map<String, dynamic> toJson() =>
      {'value': value, 'contact': contato.toJson()};

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contato}';
  }
}
