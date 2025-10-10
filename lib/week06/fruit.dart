import 'dart:math';
import 'package:flutter/material.dart';

class Fruit extends StatefulWidget {
  const Fruit({super.key});

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  final Random _random = Random();

  final List<Map<String, dynamic>> fruits = [
    {"name": "Apple", "image": "assets/images/baking.jpg", "price": 100},
    {"name": "Banana", "image": "assets/images/clock-tower.jpg", "price": 200},
    {"name": "Orange", "image": "assets/images/landscape.png", "price": 300},
  ];

  Map<String, dynamic>? _currentFruit;
  int turn = 0;
  int totalScore = 0;
  bool gameOver = false;

  void _catchFruit() {
    if (gameOver) return;
    setState(() {
      _currentFruit = fruits[_random.nextInt(fruits.length)];
      totalScore += _currentFruit!["price"] as int;
      turn++;
      if (turn >= 3) {
        gameOver = true;
      }
    });
  }

  void _resetGame() {
    setState(() {
      turn = 0;
      totalScore = 0;
      gameOver = false;
      _currentFruit = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Catch the Fruit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentFruit != null) ...[
              Image.asset(_currentFruit!["image"], width: 150, height: 150),
              const SizedBox(height: 10),
              Text(
                "${_currentFruit!["name"]} : ${_currentFruit!["price"]} pts",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ] else
              const Text(
                "Press Catch to get a fruit 🍎🍌🍊",
                style: TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 30),
            Text("Turn: $turn / 3", style: const TextStyle(fontSize: 18)),
            Text(
              "Total Score: $totalScore pts",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            if (!gameOver)
              ElevatedButton(
                onPressed: _catchFruit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  "Catch Fruit",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            else ...[
              Text(
                "Game Over!\nYour total score: $totalScore pts",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _resetGame,
                child: const Text(
                  "Play Again",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
