import 'package:flutter/material.dart';
import 'package:flutter_application_1/example.dart';
import 'package:flutter_application_1/main_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome!"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            BodyText(title: "Dice"),
            BodyText(title: "Domino"),
            BodyText(title: "Sneakers"),
            BodyText(title: "Babe"),
            BodyText(title: "Dice"),
            BodyText(title: "Domino"),
            BodyText(title: "Sneakers"),
            BodyText(title: "Babe"),
          ],
        ),
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          color: Colors.orange,
          alignment: Alignment.center,
          height: 40,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              backgroundColor: Colors.yellow,
              color: Colors.purple,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

/*
Column example
BodyText(title: "Dice"),
          BodyText(title: "2 Baddies 1 Porshe"),
          BodyText(title: "Born Pink"),
          BodyText(title: "Faster"),
          BodyText(title: "Hype Boy"),
*/
