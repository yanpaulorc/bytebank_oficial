import 'package:bytebank_oficial/screens/contatos_lista.dart';
import 'package:bytebank_oficial/screens/transacao_lista.dart';
import 'package:flutter/material.dart';

import '../customs/theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/bytebank_logo.png'),
          ),
          Row(
            children: [
              _FeatureItem(
                  nome: 'Transfers',
                  icone: Icons.monetization_on,
                  onClick: () => _showContactsList(context)),
              _FeatureItem(
                  nome: 'Transaction Feed',
                  icone: Icons.description,
                  onClick: () => _showTransactionsList(context)),
            ],
          ),
        ],
      ),
    );
  }

  void _showContactsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ContatoLista(),
      ),
    );
  }

  void _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransacoesLista(),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    Key? key,
    this.nome,
    this.icone,
    this.onClick,
  }) : super(key: key);

  final String? nome;
  final IconData? icone;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: AppTheme.primaryColor,
        child: InkWell(
          onTap: () => onClick!(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icone, color: Colors.white, size: 30),
                Text(
                  nome!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
