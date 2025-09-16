import 'dart:math';
import 'package:flutter/material.dart';

class GuessNumber extends StatefulWidget {
  const GuessNumber({super.key});

  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  final TextEditingController _controller = TextEditingController();
  late int randomNumber;
  int attempts = 3;
  String feedback = "";
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    randomNumber = Random().nextInt(10);
    attempts = 3;
    feedback = "";
    gameOver = false;
    _controller.clear();
    setState(() {});
  }

  void _checkGuess() {
    if (_controller.text.isEmpty ||
        int.tryParse(_controller.text) == null ||
        int.parse(_controller.text) < 0 ||
        int.parse(_controller.text) > 9) {
      setState(() {
        feedback = "Please enter a number between 0 and 9";
      });
      return;
    }

    int guess = int.parse(_controller.text);

    setState(() {
      if (guess == randomNumber) {
        feedback = "Correct, you win!";
        gameOver = true;
      } else {
        attempts--;
        if (attempts == 0) {
          feedback = "Sorry, you lose. The answer is $randomNumber";
          gameOver = true;
        } else {
          feedback = guess > randomNumber
              ? "$guess is too large, $attempts chance(s) left!"
              : "$guess is too small, $attempts chance(s) left!";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text("Guess a number game"),
        backgroundColor: Colors.purple[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              enabled: !gameOver,
              decoration: const InputDecoration(
                hintText: "Guess a number 0-9",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            Text(feedback, style: TextStyle(color: Colors.red, fontSize: 16)),
            const SizedBox(height: 5),

            ElevatedButton(
              onPressed: gameOver ? _resetGame : _checkGuess,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              child: Text(gameOver ? "Replay" : "Guess"),
            ),
          ],
        ),
      ),
    );
  }
}
