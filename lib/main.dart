import 'package:bytebank_oficial/components/transaction_auth_dialog.dart';
import 'package:bytebank_oficial/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
  // findAll().then((transactions) => print('new transactinos ${transactions}'));
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
    );
  }
}
