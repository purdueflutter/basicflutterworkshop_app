import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_view.dart';

import 'class/manage_view.dart';
import 'theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
              onPressed: () => setState(() => selectedTab = 0),
              iconSize: 32,
              color: darkBlueColor,
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () => setState(() => selectedTab = 1),
              iconSize: 32,
              color: darkBlueColor,
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
