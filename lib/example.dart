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
        ],
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
