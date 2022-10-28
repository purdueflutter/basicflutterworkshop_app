import 'package:flutter/material.dart';

import '../theme.dart';

class NewClassButton extends StatelessWidget {
  const NewClassButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      child: TextButton(
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => NewExamDialog(),
          );
          setState(() {
            exams.add(ExamContainer(
              date: result['date'],
              course: result['course'],
              venue: result['venue'],
              topicsCovered: result['topics'],
            ));
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: darkBlueColor,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 180,
                child: Text(
                  "Create a New Exam Event",
                  style: TextStyle(
                    color: lightColor,
                    fontSize: 20,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.add,
                  color: lightColor,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
