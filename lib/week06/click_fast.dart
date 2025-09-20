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
  int click = 0;

  void startTimer() {
    if (timer != null && timer!.isActive) return;

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
      click = 0;
    });
  }

  void incrementClick() {
    if (count > 0 && count != 1) {
      setState(() {
        click++;
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 247, 255),
      body: Center(
        child: Container(
          width: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                count.toStringAsFixed(2),
                style: const TextStyle(color: Colors.red),
              ),
              Text('Click = $click', style: const TextStyle(fontSize: 40)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    onPressed: incrementClick,
                    icon: const Icon(Icons.ads_click, color: Colors.white),
                    label: const Text(
                      "Click",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      resetTimer();
                      startTimer();
                    },
                    icon: const Icon(Icons.refresh, color: Colors.black),
                    label: const Text(
                      "Play",
                      style: TextStyle(color: Colors.red),
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
