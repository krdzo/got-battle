import 'package:flutter/material.dart';

class CardDeckModel with ChangeNotifier {
  static const startingDeck = <String, int>{
    "Zero": 8,
    "Zero and Die": 2,
    "One Fort": 4,
    "One Sword": 4,
    "Two": 4,
    "Three": 2,
  };
  static const startingTotal = 24;

  // ignore: prefer_typing_uninitialized_variables
  late final cards;
  late int total;

  CardDeckModel() {
    cards = Map.from(startingDeck);
    total = startingTotal;
  }

  void resetDeck() {
    for (var key in startingDeck.keys) {
      cards[key] = startingDeck[key];
    }

    total = startingTotal;
    notifyListeners();
  }

  void decrementCount(String field) {
    if (cards[field] == 0) return;
    cards[field]--;
    total--;

    if (total == 0) {
      resetDeck();
    }
    notifyListeners();
  }

  void incrementCount(String field) {
    if (total == startingTotal) return;
    cards[field]++;
    total++;
    notifyListeners();
  }

  int getCount(String field) {
    return cards[field];
  }
}
