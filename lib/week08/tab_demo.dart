import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget {
  const TabDemo({super.key});

  @override
  State<TabDemo> createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> {
  String message = 'Home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('Tab Demo')),
        bottomNavigationBar: Container(
          color: Colors.amber,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: message),
              Tab(icon: Icon(Icons.train), text: 'Train'),
              Tab(icon: Icon(Icons.bike_scooter), text: 'Bike'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(color: Colors.yellow, child: Text(message)),
            Container(color: Colors.green, child: Text('Home')),
            Container(
              alignment: Alignment.topCenter,
              color: Colors.red,
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    message = 'Hello';
                  });
                },
                child: Text('Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
