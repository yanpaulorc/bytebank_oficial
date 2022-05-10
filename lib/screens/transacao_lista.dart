import 'package:bytebank_oficial/components/centered_message.dart';
import 'package:bytebank_oficial/components/progress.dart';
import 'package:bytebank_oficial/customs/theme.dart';
import 'package:bytebank_oficial/http/webclients/transaction_webclient.dart';
import 'package:flutter/material.dart';
import 'package:bytebank_oficial/models/transaction.dart';

class TransacoesLista extends StatelessWidget {
  TransacoesLista({Key? key}) : super(key: key);

  final TransactionWebClient _webCliente = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    // transactions.add(Transaction(100.0, Contatos(0, 'Alex', '1000-1')));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _webCliente.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return const Progress(message: 'Loading');
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transaction>? transactions = snapshot.data;
                if (transactions!.isNotEmpty) {}
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Transaction transaction = transactions[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.monetization_on),
                        title: Text(
                          transaction.value.toString(),
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transaction.contato.numeroConta.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                );
              }
              return CenteredMessage('No transactions found',
                  icon: Icons.warning);
              break;
          }
          return CenteredMessage(
            ('Unknow Error'),
            icon: Icons.warning,
          );
        },
      ),
    );
  }
}
