// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

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
    return MaterialApp(
      title: "GoT Battle",
      home: ChangeNotifierProvider<CardDeckModel>(
        create: (context) => CardDeckModel(),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = Provider.of<CardDeckModel>(context).total;

    return Scaffold(
      appBar: AppBar(title: const Text("Battle")),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) =>
              GridView.count(
                childAspectRatio: (constraints.maxWidth / 2) / (constraints.maxHeight / 3),
                crossAxisCount: 2,
                children: [
                  for (var key in CardDeckModel.startingDeck.keys)
                    InfoCard(cardName: key)
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _resetDeck(context),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Total: $total"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _resetDeck(BuildContext context) {
    Provider.of<CardDeckModel>(context, listen: false).resetDeck();
  }
}

/// Widget that shows information about a type of card.
/// It shows a card name, number of left cards in the deck and
/// it's probability to be drawn next be drawn next.
class InfoCard extends StatelessWidget {
  final String cardName;

  const InfoCard({
    Key? key,
    required this.cardName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = Provider.of<CardDeckModel>(context).total;
    int cardCount = Provider.of<CardDeckModel>(context).getCount(cardName);

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
                  "$cardCount",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  cardName,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Probability: ${(cardCount / total * 100).toStringAsFixed(2)}",
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
                onPressed: () => _incrementCount(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  _incrementCount(BuildContext context) {
    Provider.of<CardDeckModel>(context, listen: false).incrementField(cardName);
  }
}
