import 'package:flutter/material.dart';

class CardDeckModel with ChangeNotifier {
  static const startingDeck = {
    "Threes": 2,
    "Twos": 4,
    "One Fortification": 4,
    "One Sword": 4,
    "Zero": 8,
    "Zero or Die": 2,
  };
  static const startingTotal = 24;

  var cards = Map.from(startingDeck);
  int total = startingTotal;

  void resetDeck() {
    cards = Map.from(startingDeck);
  }

  void decrementField(String field) {
    if (field == "total") {
      return;
    }

    cards[field] -= 1;
    cards["total"] -= 1;
    if (cards["total"] == 0) {
      resetDeck();
    }
    notifyListeners();
  }

  void incrementField(String field) {
    cards[field]++;
    total++;
    notifyListeners();
  }

  int getCount(String field) {
    return cards[field];
  }
}
