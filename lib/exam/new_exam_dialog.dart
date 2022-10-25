import 'package:flutter/material.dart';

import '../theme.dart';

class NewExamDialog extends StatefulWidget {
  const NewExamDialog({Key? key}) : super(key: key);

  @override
  State<NewExamDialog> createState() => _NewExamDialogState();
}

class _NewExamDialogState extends State<NewExamDialog> {
  String? course;
  String? date;
  String? venue;
  String? topics;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: pinkColor,
      title: Text(
        'Create New Exam',
        style: TextStyle(
          color: lightColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Form(
        onChanged: () => Form.of(primaryFocus!.context!)!.save(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Course',
                icon: Icon(Icons.class_, color: lightColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lightColor),
                ),
                floatingLabelStyle: TextStyle(color: lightColor),
              ),
              cursorColor: lightColor,
              onSaved: (value) => course = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Date',
                icon: Icon(Icons.class_, color: lightColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lightColor),
                ),
                floatingLabelStyle: TextStyle(color: lightColor),
              ),
              cursorColor: lightColor,
              onSaved: (value) => date = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Venue',
                icon: Icon(Icons.class_, color: lightColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lightColor),
                ),
                floatingLabelStyle: TextStyle(color: lightColor),
              ),
              cursorColor: lightColor,
              onSaved: (value) => venue = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Topics',
                icon: Icon(Icons.class_, color: lightColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lightColor),
                ),
                floatingLabelStyle: TextStyle(color: lightColor),
              ),
              cursorColor: lightColor,
              onSaved: (value) => topics = value,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: Text("Submit", style: TextStyle(color: lightColor)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(darkBlueColor),
          ),
          onPressed: () {
            Navigator.pop(context, {
              'course': course,
              'date': date,
              'venue': venue,
              'topics': topics
            });
          },
        )
      ],
    );
  }
}
