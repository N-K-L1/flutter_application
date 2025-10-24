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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Hello Snackbar'),
                duration: const Duration(seconds: 1), //default is 4 secs
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    debugPrint('Undo something');
                  },
                ),
              ),
            );
          },
          child: const Text('Show'),
        ),
      ),
    );
  }
}
