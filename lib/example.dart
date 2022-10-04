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
              itemCount: 5,
              itemBuilder: (context, index) => ExamContainer(),
            ),
          ),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {},
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
  const ExamContainer({
    Key? key,
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
                      "20th September",
                      style: TextStyle(
                        color: lightColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextBox(text: "Exam: Calculus III"),
                  TextBox(text: "Venue: Elliot Hall"),
                  TextBox(text: "Topics Covered:"),
                  SizedBox(height: 5),
                  ExamBox(topic: "Geometry of Space"),
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
