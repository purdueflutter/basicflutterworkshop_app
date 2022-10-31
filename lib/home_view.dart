import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/bloc/class_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'class/class_container.dart';
import 'exam/exam_container.dart';
import 'exam/new_exam_dialog.dart';
import 'theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ExamContainer> exams = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 10, maxHeight: 500),
          child: BlocBuilder<ClassBloc, ClassState>(
            builder: (context, state) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.classes.length,
                itemBuilder: (context, index) =>
                    ClassContainer($class: state.classes[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
