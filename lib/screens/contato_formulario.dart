import 'package:bytebank_oficial/customs/theme.dart';
import 'package:bytebank_oficial/database/dao/contato_dao.dart';
import 'package:bytebank_oficial/models/contatos.dart';
import 'package:flutter/material.dart';

class ContatoFormulario extends StatefulWidget {
  const ContatoFormulario({Key? key}) : super(key: key);

  @override
  State<ContatoFormulario> createState() => _ContatoFormularioState();
}

class _ContatoFormularioState extends State<ContatoFormulario> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _contaController = TextEditingController();
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo contato"),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            newTextForm(
              nomeController: _nomeController,
              rotulo: 'Nome completo',
              textInputType: TextInputType.name,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: newTextForm(
                nomeController: _contaController,
                rotulo: 'Número da conta',
                textInputType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String nome = _nomeController.text;
                    final String numeroConta = _contaController.text;
                    final Contatos novoContato = Contatos(0, nome, numeroConta);
                    _dao.save(novoContato).then((id) => Navigator.pop(context));
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class newTextForm extends StatelessWidget {
  const newTextForm({
    Key? key,
    required TextEditingController nomeController,
    this.rotulo,
    required this.textInputType,
  })  : _nomeController = nomeController,
        super(key: key);

  final TextEditingController _nomeController;
  final String? rotulo;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nomeController,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: AppTheme.primaryColor),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primaryColor)),
        labelText: rotulo,
      ),
      style: const TextStyle(fontSize: 20),
      keyboardType: textInputType,
    );
  }
}
