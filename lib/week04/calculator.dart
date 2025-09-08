// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //State variables
  String message = '';
  TextEditingController tcNum1 = TextEditingController();
  TextEditingController tcNum2 = TextEditingController();

  //Functions
  void CalculateSum() {
    setState(() {
      if (tcNum1.text.isEmpty || tcNum2.text.isEmpty) {
        message = 'Please input both numbers';
        return;
      } else if (tcNum1.text.contains(RegExp(r'[^0-9]')) ||
          tcNum2.text.contains(RegExp(r'[^0-9]'))) {
        message = 'Please input only numbers';
        return;
      } else {
        int num1 = int.tryParse(tcNum1.text) ?? 0;
        int num2 = int.tryParse(tcNum2.text) ?? 0;
        int sum = num1 + num2;
        message = 'Result = $sum';
      }
    });
  }

  void CalculatePower() {
    setState(() {
      if (tcNum1.text.isEmpty || tcNum2.text.isEmpty) {
        message = 'Please input both numbers';
        return;
      } else if (tcNum1.text.contains(RegExp(r'[^0-9]')) ||
          tcNum2.text.contains(RegExp(r'[^0-9]'))) {
        message = 'Please input only numbers';
        return;
      } else {
        int num1 = int.tryParse(tcNum1.text) ?? 0;
        int num2 = int.tryParse(tcNum2.text) ?? 0;
        int pow = 1;
        for (int i = 0; i < num2; i++) {
          pow = pow * num1;
        }
        message = 'Result =  $pow';
      }
    });
  }

  void ClearText() {
    setState(() {
      tcNum1.text = '';
      tcNum2.text = '';
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(40, 148, 236, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              controller: tcNum1,
              decoration: InputDecoration(hintText: 'Number 1'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              controller: tcNum2,
              decoration: InputDecoration(hintText: 'Number 2'),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: CalculateSum,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 193, 7),
            ),
            child: const Text('Sum', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: CalculatePower,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(40, 148, 236, 1),
            ),
            child: const Text('Power', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: ClearText,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 244, 67, 54),
            ),
            child: const Text('Clear', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
          ),
        ],
      ),
    );
  }
}
