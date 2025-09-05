import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  //State variables and methods here
  String message = "Hello friends";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter app", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: Text(
          message,
          style: TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 255, 0, 255),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('Button pressed');
          setState(() {
            if (message == "Hello me") {
              message = "Hello friends";
            } else {
              message = "Hello me";
            }
          });
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
