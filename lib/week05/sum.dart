import 'package:flutter/material.dart';

class Sum extends StatefulWidget {
  const Sum({super.key});

  @override
  State<Sum> createState() => _SumState();
}

class _SumState extends State<Sum> {
  //State variables
  String message = '';
  TextEditingController tcNum1 = TextEditingController();
  TextEditingController tcNum2 = TextEditingController();

  //Functions
  void CalculateSum() {
    setState(() {
      if (tcNum1.text.isEmpty ||
          tcNum2.text.isEmpty ||
          tcNum1.text.contains(RegExp(r'[^0-9]')) ||
          tcNum2.text.contains(RegExp(r'[^0-9]'))) {
        message = 'Incorrect input';
        return;
      } else {
        int num1 = int.tryParse(tcNum1.text) ?? 0;
        int num2 = int.tryParse(tcNum2.text) ?? 0;
        int sum = num1 + num2;
        message = 'Result = $sum';
      }
    });
  }

  void ClearText() {
    setState(() {
      tcNum1.clear();
      tcNum2.clear();
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sum Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(40, 148, 236, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 130,
                child: TextField(
                  controller: tcNum1,
                  decoration: InputDecoration(hintText: 'First Number'),
                ),
              ),
              const SizedBox(width: 8),
              const Text('+'),
              const SizedBox(width: 8),
              SizedBox(
                width: 130,
                child: TextField(
                  controller: tcNum2,
                  decoration: InputDecoration(hintText: 'Second Number'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: CalculateSum,
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: ClearText,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Clear',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ],
      ),
    );
  }
}
