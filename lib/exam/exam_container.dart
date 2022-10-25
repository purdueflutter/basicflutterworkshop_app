import 'package:flutter/material.dart';

import '../components.dart';
import '../theme.dart';
import 'exam_box.dart';

class ExamContainer extends StatelessWidget {
  final String date;
  final String course;
  final String venue;
  final String topicsCovered;

  const ExamContainer({
    Key? key,
    required this.date,
    required this.course,
    required this.venue,
    required this.topicsCovered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 5, right: 15, top: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: pinkColor,
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: pinkColor.withOpacity(0.6),
                  offset: Offset(10, 10),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      date,
                      style: TextStyle(
                        color: lightColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextBox(text: "Exam: $course"),
                  TextBox(text: "Venue: $venue"),
                  TextBox(text: "Topics Covered:"),
                  SizedBox(height: 5),
                  ExamBox(topic: topicsCovered),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Image(
                      alignment: Alignment.center,
                      height: 80,
                      image: AssetImage("assets/images/calculator.png"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
