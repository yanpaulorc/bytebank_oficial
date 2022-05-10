import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(message!),
          ),
        ],
      ),
    );
  }
}
