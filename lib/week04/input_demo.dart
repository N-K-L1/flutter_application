import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  //State variables
  String message = '';
  TextEditingController tcName = TextEditingController();

  //Functions
  void updateText() {
    setState(() {
      message = 'Hello, ${tcName.text}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Demo',
          style: TextStyle(fontFamily: 'SigmarOne'),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
                suffixIcon: IconButton(
                  onPressed: tcName.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
              controller: tcName,
            ),
          ),
          ElevatedButton(
            //onPressed: () => updateText(),
            onPressed: updateText,
            child: const Text(
              'Submit',
              style: TextStyle(fontFamily: 'SigmarOne'),
            ),
          ),
          SizedBox(height: 16),
          Text(message, style: TextStyle(fontFamily: 'SigmarOne')),
        ],
      ),
    );
  }
}
