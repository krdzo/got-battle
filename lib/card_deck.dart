import 'package:flutter/material.dart';

class CardDeck with ChangeNotifier {
  static const fullDeck = {
    "Threes": 2,
    "Twos": 4,
    "One Fortification": 4,
    "One Sword": 4,
    "Zero": 8,
    "Zero or Die": 2,
    "total": 24,
  };
  var cards = Map.from(fullDeck);

  void resetDeck() {
    cards = Map.from(fullDeck);
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
    if (field == "total") {
      resetDeck();
    } else {
      cards[field] += 1;
      cards["total"] += 1;
    }
    notifyListeners();
  }

  int getField(String field) {
    return cards[field];
  }
}
