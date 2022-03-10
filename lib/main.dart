// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

var testKartica = {
  "Threes": 2,
  "Twos": 4,
  "One Fortification": 4,
  "One Sword": 4,
  "Zero": 8,
  "Zero or Die": 2,
};
var totalKartica = 24;

void main() {
  runApp(const GoT());
}

class GoT extends StatelessWidget {
  const GoT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "GoT Battle",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Battle")),
      body: Card(
        color: Colors.greenAccent,
        child: Column(
          children: [
            Expanded(
              flex: 2,
                child: Row(
                  children: [
                    Expanded(child: AboutCard()),
                    Expanded(child: AboutCard()),
                  ],
                ),
            ),
            Expanded(
              flex: 1,
              child: Center(child: Text("Sum probability: 100%")),
            )
          ],
        ),
      ),
    );
  }
}

/// Widget that shows a card name number of left cards and probabilty of drawing
/// it next.
class AboutCard extends StatelessWidget {
  const AboutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "8",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Zero",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Probability: 50%",
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
