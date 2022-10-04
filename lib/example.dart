import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart';

const darkColor = Color(0xff0A210F);
const lightColor = Color(0xffFFEECF);
const darkBlueColor = Color(0xff253C78);
const lightBlueColor = Color(0xff7C9299);
const pinkColor = Color(0xffD36582);

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  List<ExamContainer> exams = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Academic Events",
          style: TextStyle(
            color: lightColor,
          ),
        ),
        backgroundColor: darkBlueColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Exams Today",
              style: TextStyle(
                fontSize: 28,
                color: darkBlueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: exams.length,
              itemBuilder: (context, index) => exams[index],
            ),
          ),
          SizedBox(height: 15),
          Container(
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
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Classes Today",
              style: TextStyle(
                fontSize: 28,
                color: darkBlueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ClassContainer(
            date: "10:30 AM",
            subject: "CS180 - Obj Oriented Programming",
          ),
          SizedBox(height: 5.0),
          ClassContainer(
            date: "1:30 PM",
            subject: "CS250 - Microeconomics",
          ),
          SizedBox(height: 5.0),
          ClassContainer(
            date: "3:30 PM",
            subject: "MA251 - Multivariate Calculus",
          ),
        ],
      ),
    );
  }
}

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

class ClassContainer extends StatelessWidget {
  final String subject;
  final String date;

  const ClassContainer({
    Key? key,
    required this.subject,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width * 8,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: pinkColor.withOpacity(0.4),
                offset: Offset(10, 10),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: pinkColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      subject,
                      style: TextStyle(
                        fontSize: 18,
                        color: darkBlueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
                  TextBox(text: "Exam: ${course}"),
                  TextBox(text: "Venue: ${venue}"),
                  TextBox(text: "Topics Covered:"),
                  SizedBox(height: 5),
                  ExamBox(topic: "${topicsCovered}"),
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
