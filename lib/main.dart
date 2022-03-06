import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_deck.dart';

void main() {
  runApp(const GoT());
}

class GoT extends StatelessWidget {
  const GoT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardDeck>(
      create: (BuildContext context) => CardDeck(),
      child: MaterialApp(
        title: "Tides of a Battle",
        home: Scaffold(
          appBar: AppBar(title: const Text("Battle")),
          body: Column(
            children: CardDeck.fullDeck.entries.map((entry) {
              return Expanded(child: Card(entry.key));
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String cardText;
  const Card(this.cardText, {Key? key}) : super(key: key);


  void _incrementCount(BuildContext context) {
    Provider.of<CardDeck>(context, listen: false).incrementField(cardText);
  }

  void _decrementCount(BuildContext context) {
    Provider.of<CardDeck>(context, listen: false).decrementField(cardText);
  }

  @override
  Widget build(BuildContext context) {
    int cardsLeft = Provider.of<CardDeck>(context).getField("total");

    int count = Provider.of<CardDeck>(context).getField(cardText);

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextButton(
            onPressed: () => _incrementCount(context),
            child: const Text(
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
          child: GestureDetector(
            onTap: () => _decrementCount(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cardText,
                  style: const TextStyle(fontSize: 20),
                ),
                Text("Probability "
                    "${(count / cardsLeft * 100).toStringAsFixed(2)}%"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
