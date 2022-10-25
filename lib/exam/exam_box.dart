import 'package:flutter/material.dart';

import '../theme.dart';

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
