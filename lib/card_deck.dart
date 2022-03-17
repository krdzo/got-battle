import 'package:flutter/material.dart';

class CardDeckModel with ChangeNotifier {
  static const totalNumberOfCardsInDeck = 24;
  final deck = [
    Cards("Zero", 8),
    Cards("Zero and Die", 2),
    Cards("One Fort", 4),
    Cards("One Sword", 4),
    Cards("Two", 4),
    Cards("Three", 2),
  ];
  int remainingInDeck = totalNumberOfCardsInDeck;

  void decrementCount(Cards cards) {
    if (cards.remainingCards == 0) return;
    remainingInDeck--;
    cards.remainingCards--;
    if (remainingInDeck == 0) resetDeck();
    notifyListeners();
  }

  void incrementCount(Cards cards) {
    if (cards.remainingCards == cards.cardsInTotal) return;
    remainingInDeck++;
    cards.remainingCards++;
    notifyListeners();
  }

  void resetDeck() {
    for (var cards in deck) {
      cards.remainingCards = cards.cardsInTotal;
    }
    remainingInDeck = totalNumberOfCardsInDeck;
    notifyListeners();
  }
}

class Cards {
  late int remainingCards;
  final int cardsInTotal;
  final String name;

  Cards(this.name, this.cardsInTotal) {
    remainingCards = cardsInTotal;
  }
}
