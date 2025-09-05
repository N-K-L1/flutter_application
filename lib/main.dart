import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "My first app",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: const Center(child: Text("Hello world")),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.orange,
        child: Text("click"),
      ),
    ),
  ),
);
