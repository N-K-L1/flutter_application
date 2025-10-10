import 'dart:math';
import 'package:flutter/material.dart';

class FishGame extends StatefulWidget {
  const FishGame({super.key});

  @override
  State<FishGame> createState() => _FishGameState();
}

class _FishGameState extends State<FishGame> {
  final Random _random = Random();

  // รายชื่อปลา พร้อมราคา
  final List<Map<String, dynamic>> fishes = [
    {"image": "assets/images/baking.jpg", "price": 100},
    {"image": "assets/images/sry.jpg", "price": 200},
    {"image": "assets/images/salad.jpg", "price": 300},
  ];

  Map<String, dynamic>? _currentFish;

  void _randomFish() {
    setState(() {
      _currentFish = fishes[_random.nextInt(fishes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    int? turn;
    int? totalScore;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("🎣 เกมสุ่มปลา"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentFish != null) ...[
              Image.asset(_currentFish!["image"], width: 200, height: 200),
              const SizedBox(height: 10),
              Text(
                "ราคา: ${_currentFish!["price"]} บาท",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ] else
              const Text(
                "กดปุ่มเพื่อสุ่มปลา 🎏",
                style: TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _randomFish,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "สุ่มปลา",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Text("Turn: $turn / 3", style: const TextStyle(fontSize: 18)),
            Text(
              "Total Score: $totalScore pts",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
