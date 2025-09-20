import 'dart:async';
import 'package:flutter/material.dart';

class ClickFast extends StatefulWidget {
  const ClickFast({super.key});

  @override
  State<ClickFast> createState() => _ClickFastState();
}

class _ClickFastState extends State<ClickFast> {
  double count = 1.00; // start at 1.00
  Timer? timer;

  void startTimer() {
    timer?.cancel(); // prevent multiple timers
    timer = Timer.periodic(const Duration(milliseconds: 10), (t) {
      setState(() {
        count -= 0.01;
        if (count <= 0) {
          count = 0.00;
          t.cancel();
        }
      });
    });
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      count = 1.00;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Counter
              Text(
                count.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    onPressed: startTimer,
                    icon: const Icon(Icons.play_arrow, color: Colors.white),
                    label: const Text(
                      "Start",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    onPressed: resetTimer,
                    icon: const Icon(Icons.refresh, color: Colors.white),
                    label: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
