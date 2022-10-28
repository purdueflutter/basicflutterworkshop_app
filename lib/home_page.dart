import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/manage_view.dart';
import 'package:flutter_application_1/home_view.dart';

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
  int selectedTab = 0;

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
      body: IndexedStack(
        index: selectedTab,
        children: const [
          HomeView(),
          ManageView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              iconSize: 32,
              color: darkBlueColor,
              onPressed: () => setState(() => selectedTab = 0),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              iconSize: 32,
              color: darkBlueColor,
              onPressed: () => setState(() => selectedTab = 1),
            ),
          ],
        ),
      ),
    );
  }
}
