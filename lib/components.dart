import 'package:flutter/material.dart';
import 'package:flutter_application_1/example.dart';

class ExamBox extends StatelessWidget {
  const ExamBox({Key? key, required this.topic}) : super(key: key);

  final topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 180,
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))),
      child: Text(
        topic,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: darkBlueColor,
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({Key? key, required this.text}) : super(key: key);

  final text;

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
