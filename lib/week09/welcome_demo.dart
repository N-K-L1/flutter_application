import 'package:flutter/material.dart';
import 'drawer_widget.dart';

class WelcomeDemo extends StatelessWidget {
  const WelcomeDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Demo')),
      drawer: const DrawerWidget(),
      body: const Align(
        alignment: Alignment.topCenter,
        child: Text('Welcome page'),
      ),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: false, //default is true
    );
  }
}
