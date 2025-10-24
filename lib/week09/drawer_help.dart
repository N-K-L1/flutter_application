import 'package:flutter/material.dart';
import 'drawer_widget.dart';

class DrawerHelp extends StatelessWidget {
  const DrawerHelp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help')),
      drawer: const DrawerWidget(),
      body: Container(
        alignment: Alignment.topCenter,
        child: const Text('Help page'),
      ),
    );
  }
}
