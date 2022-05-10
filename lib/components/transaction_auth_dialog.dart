import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  const TransactionAuthDialog({Key? key, required this.onConfirm})
      : super(key: key);

  final Function(String password) onConfirm;

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

final TextEditingController _passwordController = TextEditingController();

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        style: TextStyle(fontSize: 60, letterSpacing: 24),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        TextButton(
            onPressed: () {
              widget.onConfirm(_passwordController.text);
              Navigator.pop(context);
            },
            child: Text('Confirm'))
      ],
    );
  }
}
