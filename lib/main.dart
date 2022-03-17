import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_deck.dart';
import 'util.dart';

void main() {
  runApp(const GoT());
}

class GoT extends StatelessWidget {
  const GoT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GoT Battle",
      theme: ThemeData(
          primarySwatch: createMaterialColor(const Color(0xff560b0d)),
          scaffoldBackgroundColor: const Color(0xff67615d)
          // primaryColor: Color(0xFF3a120f),
          ),
      home: ChangeNotifierProvider<CardDeckModel>(
        create: (context) => CardDeckModel(),
        child: const HomeScreen(),
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
    var deckProvider = Provider.of<CardDeckModel>(context);
    var deck = deckProvider.deck;
    int remainingInDeck = deckProvider.remainingInDeck;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Battle"),
      ),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
                builder: (context, constraints) => GridView.count(
                      childAspectRatio: (constraints.maxWidth / 2) /
                          (constraints.maxHeight / 3),
                      crossAxisCount: 2,
                      children: [
                        for (var cards in deck) InfoCard(cardGroup: cards)
                      ],
                    )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _resetDeck(context),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                      "Remaning: $remainingInDeck  / ${CardDeckModel.totalNumberOfCardsInDeck}"),
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
  final Cards cardGroup;

  const InfoCard({
    Key? key,
    required this.cardGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cardsName = cardGroup.name;
    int numberOfCards = cardGroup.remainingCards;
    int remainingDeck = Provider.of<CardDeckModel>(context).remainingInDeck;

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        color: const Color(0xffdedbdb),
        child: Stack(
          fit: StackFit.expand,
          children: [
            InkWell(
              splashColor: const Color(0xff7d7b7b),
              onTap: () => _decrementCount(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$numberOfCards",
                    style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    cardsName,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Probability: ${(numberOfCards / remainingDeck * 100).toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                splashColor: const Color(0xff7d7b7b),
                iconSize: 33,
                icon: const Icon(Icons.add),
                onPressed: () => _incrementCount(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  _incrementCount(BuildContext context) {
    Provider.of<CardDeckModel>(context, listen: false)
        .incrementCount(cardGroup);
  }

  _decrementCount(BuildContext context) {
    Provider.of<CardDeckModel>(context, listen: false)
        .decrementCount(cardGroup);
  }
}
