import 'dart:math';
import 'package:flutter/material.dart';

class RandomDemo extends StatefulWidget {
  const RandomDemo({super.key});

  @override
  State<RandomDemo> createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  String result = '';
  TextEditingController tcMin = TextEditingController();
  TextEditingController tcMax = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void generateRandom() {
      int? min = int.tryParse(tcMin.text);
      int? max = int.tryParse(tcMax.text);

      if (min == null || max == null || min >= max) {
        setState(() {
          result = 'Wrong input!';
        });
        return;
      } else {
        //generate a random number
        int random = min + Random().nextInt(max - min + 1);
        setState(() {
          //result = randomNumber.toString();
          result = '$random';
        });
      }
    }

    void clear() {
      tcMin.clear();
      tcMax.clear();
      setState(() {
        result = '';
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Random Integer Number Generator'),
              TextField(
                controller: tcMin,
                decoration: InputDecoration(hintText: 'min'),
              ),
              TextField(
                controller: tcMax,
                decoration: InputDecoration(hintText: 'max'),
              ),
              SizedBox(height: 8),
              Text(result, style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: generateRandom,
                    child: Text('Generate'),
                  ),
                  SizedBox(width: 8),
                  FilledButton(onPressed: clear, child: Text('Clear')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
