//6631501179
import 'package:flutter/material.dart';
import 'dart:math';

class Farm extends StatefulWidget {
  const Farm({super.key});

  @override
  State<Farm> createState() => _FarmState();
}

class _FarmState extends State<Farm> {
  final Random _random = Random();

  final List<Color> threeColors = const [
    Color(0xFFBCDDDC),
    Color(0xFFFFEDD1),
    Color.fromARGB(255, 147, 29, 3),
  ];

  final List<Map<String, dynamic>> catalog = [
    {'name': 'Carrot', 'price': 20, 'image': 'assets/images/farm/carrot.png'},
    {'name': 'Corn', 'price': 39, 'image': 'assets/images/farm/corn.png'},
    {'name': 'Tomato', 'price': 46, 'image': 'assets/images/farm/tomato.png'},
    {
      'name': 'Broccoli',
      'price': 98,
      'image': 'assets/images/farm/broccoli.png',
    },
    {
      'name': 'Pumpkin',
      'price': 150,
      'image': 'assets/images/farm/pumpkin.png',
    },
  ];

  Map<String, dynamic>? _currentcatalog;
  int totalScore = 0;
  bool gameOver = false;

  void _catchFruit() {
    if (gameOver) return;
    setState(() {
      int num = Random().nextInt(5);
      _currentcatalog = catalog[_random.nextInt(catalog.length)];
      totalScore += _currentcatalog!["price"] * num as int;
      gameOver = true;
    });
  }

  void _resetGame() {
    setState(() {
      totalScore = 0;
      gameOver = false;
      _currentcatalog = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MFU Farm',
          style: TextStyle(color: Color.fromARGB(255, 147, 29, 3)),
        ),
        backgroundColor: Color(0xFFBCDDDC),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              if (_currentcatalog != null) ...[
                Row(
                  children: [
                    Image.asset(
                      _currentcatalog!["image"],
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${_currentcatalog!["name"]} : $num ${_currentcatalog!["price"]} baht",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      _currentcatalog!["image"],
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${_currentcatalog!["name"]} : $num ${_currentcatalog!["price"]} baht",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      _currentcatalog!["image"],
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${_currentcatalog!["name"]} : $num ${_currentcatalog!["price"]} baht",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ] else
                const SizedBox(height: 30),
              if (!gameOver)
                ElevatedButton(
                  onPressed: _catchFruit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBCDDDC),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    "Randomize 3 items",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 147, 29, 3),
                    ),
                  ),
                )
              else ...[
                Text(
                  "Total: $totalScore baht",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 147, 29, 3),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 147, 29, 3),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    "Reset",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
              const Text("Press Randomize to get items"),
            ],
          ),
        ),
      ),
    );
  }
}
