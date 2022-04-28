import 'package:bytebank_oficial/customs/theme.dart';
import 'package:bytebank_oficial/database/dao/contato_dao.dart';
import 'package:bytebank_oficial/models/contatos.dart';
import 'package:bytebank_oficial/screens/contato_formulario.dart';
import 'package:flutter/material.dart';

class ContatoLista extends StatefulWidget {
  const ContatoLista({Key? key}) : super(key: key);

  @override
  State<ContatoLista> createState() => _ContatoListaState();
}

final ContatoDao _dao = ContatoDao();

class _ContatoListaState extends State<ContatoLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Contatos'),
      ),
      body: FutureBuilder<List<Contatos>>(
        initialData: const [],
        future: _dao.buscaTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Carregando contatos'),
                    ),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contatos> contatos = snapshot.data as List<Contatos>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contatos contato = contatos[index];
                  return _ContatoItem(contatos: contato);
                },
                itemCount: contatos.length,
              );
          }
          return const Text('Erro no carregamento');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const ContatoFormulario(),
            ),
          )
              .then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  final Contatos? contatos;

  const _ContatoItem({Key? key, this.contatos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contatos!.nome,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contatos!.numeroConta,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
