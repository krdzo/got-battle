import 'package:flutter/material.dart';

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
          children: const [
            Expanded(child: Card(tekst: "Threes")),
            Expanded(child: Card(tekst: "Twos")),
            Expanded(child: Card(tekst: "One Sword")),
            Expanded(child: Card(tekst: "One Fortification")),
            Expanded(child: Card(tekst: "Zero")),
            Expanded(child: Card(tekst: "Zero and Die")),
            Expanded(child: Card(tekst: "Total")),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String tekst;
  const Card({Key? key, required this.tekst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: Center(
            child: Text(
              "2",
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
        const Padding(
          child: Text(
            "+",
            style: TextStyle(fontSize: 20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tekst,
                style: const TextStyle(fontSize: 18),
              ),
              const Text("procenat"),
            ],
          ),
        ),
      ],
    );
  }
}
