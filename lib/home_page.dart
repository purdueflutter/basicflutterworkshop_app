import 'package:flutter/material.dart';

import 'class/class_container.dart';
import 'exam/exam_container.dart';
import 'exam/new_exam_dialog.dart';
import 'theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
