import 'package:flutter/material.dart';

import '../theme.dart';

class NewClassDialog extends StatefulWidget {
  const NewClassDialog({Key? key}) : super(key: key);

  @override
  State<NewClassDialog> createState() => _NewClassDialogState();
}

class _NewClassDialogState extends State<NewClassDialog> {
  String? subject;
  String? semester;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: pinkColor,
      title: Text(
        'Create New Class',
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
                labelText: 'Subject',
                icon: Icon(Icons.class_, color: lightColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lightColor),
                ),
                floatingLabelStyle: TextStyle(color: lightColor),
              ),
              cursorColor: lightColor,
              onSaved: (value) => subject = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Semester',
                icon: Icon(Icons.calendar_month, color: lightColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: lightColor),
                ),
                floatingLabelStyle: TextStyle(color: lightColor),
              ),
              cursorColor: lightColor,
              onSaved: (value) => semester = value,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(darkBlueColor),
          ),
          onPressed: () {
            Navigator.pop(context, {'subject': subject, 'semester': semester});
          },
          child: Text("Submit", style: TextStyle(color: lightColor)),
        )
      ],
    );
  }
}
