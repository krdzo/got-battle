import 'package:flutter/material.dart';
import 'tides_of_battle.dart';

void main() {
  runApp(const GoT());
}

class GoT extends StatelessWidget {
  const GoT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tides of a Battle",
      home: Scaffold(
        appBar: AppBar(title: const Text("Battle")),
        body: Column(
          children: CardDeck.cards.entries.map((entry) {
            return Expanded(child: Card(entry.value, entry.key));
          }).toList(),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  static int cardsLeft = CardDeck.cards["total"]!;
  final String cardText;
  final int count;
  const Card(this.count, this.cardText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Count field
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 35),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextButton(
            onPressed: null,
            child: Text(
              "+",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cardText,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                  "Probability ${(count / cardsLeft * 100).toStringAsFixed(2)}%"),
            ],
          ),
        ),
      ],
    );
  }
}
