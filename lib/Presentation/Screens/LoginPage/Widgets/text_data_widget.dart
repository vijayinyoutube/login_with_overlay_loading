import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  const TextData({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Login ',
        style: const TextStyle(fontSize: 25.00),
        children: <TextSpan>[
          TextSpan(
            text: message,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.00,
                color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
