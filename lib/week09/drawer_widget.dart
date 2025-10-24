import 'package:flutter/material.dart';
import 'welcome_demo.dart';
import 'drawer_help.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: Row(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeGVUGslmHUWyeqopY1PThHAnuQ8XL0E2RYw&s',
                  width: 100,
                ),
                const Text('Header'),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeDemo()),
            ),
            icon: const Icon(Icons.home),
            label: const Text('Home'),
          ),
          TextButton.icon(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DrawerHelp()),
            ),
            icon: const Icon(Icons.help),
            label: const Text('Help'),
          ),
        ],
      ),
    );
  }
}
