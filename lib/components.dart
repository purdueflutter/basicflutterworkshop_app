import 'package:flutter/material.dart';

import 'theme.dart';

class TextBox extends StatelessWidget {
  final String text;

  const TextBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        text,
        style: const TextStyle(
          color: lightColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
