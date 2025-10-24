import 'package:flutter/material.dart';

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar Demo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Hello Snackbar')));
          },
          child: const Text('Show'),
        ),
      ),
    );
  }
}
