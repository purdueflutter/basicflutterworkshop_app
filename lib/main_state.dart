import 'package:flutter/material.dart';
import 'dart:math';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  int number = 0;

  setRandomNumber() {
    setState(() {
      var rng = Random();
      number = rng.nextInt(101);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("What is Stateful Widget"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              RandomButton(rando: setRandomNumber),
              Container(
                decoration: const BoxDecoration(color: Colors.amber),
                height: 50,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 20,
                child: Text(
                  "$number",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
        ));
  }
}

class RandomButton extends StatelessWidget {
  const RandomButton({Key? key, required this.rando}) : super(key: key);

  final Function rando;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        rando();
      },
      style: TextButton.styleFrom(
          backgroundColor: Colors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: const Text(
        "Give me a random number",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
