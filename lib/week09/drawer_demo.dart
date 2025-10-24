import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});
  // Method to create a drawer
  Widget createDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: Row(
              children: [
                //Image.asset('assets/images/batman.png', width: 100),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeGVUGslmHUWyeqopY1PThHAnuQ8XL0E2RYw&s',
                  width: 100,
                ),
                const Text('Header'),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.remove_circle),
            label: const Text('Item 1'),
          ),
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.add_circle),
            label: const Text('Item 2'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Demo')),
      drawer: createDrawer(context),
      body: const Center(child: Text('Welcome page')),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: false, //default is true
    );
  }
}
