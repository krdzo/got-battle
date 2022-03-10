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
      body: Column(
        children: [
          Expanded(child: RowOfTwoCards()),
          Expanded(child: RowOfTwoCards()),
          Expanded(child: RowOfTwoCards()),
        ],
      ),
    );
  }
}

/// Row that can display two cards if the card are related it will
/// display a footer that has the sum of those two cards probabilitys.
class RowOfTwoCards extends StatelessWidget {
  const RowOfTwoCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.greenAccent,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: InfoCard()),
                Expanded(child: InfoCard()),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Center(child: Text("Sum probability: 100%")),
           ),
        ],
      ),
    );
  }
}

/// Widget that shows information about a type of card.
/// It shows a card name, number of left cards in the deck and
/// it's probability to be drawn next be drawn next.
class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
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
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                iconSize: 33,
                icon: Icon(Icons.add),
                onPressed: () => debugPrint("pritisnuto"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
