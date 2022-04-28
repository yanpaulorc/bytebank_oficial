class Contatos {
  final int id;
  final String nome;
  final String numeroConta;

  Contatos(this.id, this.nome, this.numeroConta);
  @override
  String toString() {
    return 'Contatos{id: $id, nome: $nome, conta: $numeroConta}';
  }
}
