class Contatos {
  final int id;
  final String nome;
  final int numeroConta;

  Contatos(this.id, this.nome, this.numeroConta);
  @override
  String toString() {
    return 'Contatos{id: $id, nome: $nome, conta: $numeroConta}';
  }

  Contatos.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        nome = json['name'],
        numeroConta = json['accountNumber'];

  Map<String, dynamic> toJson() => {'name': nome, 'accountNumber': numeroConta};
}
