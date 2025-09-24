import 'package:flutter/material.dart';

class TouristPlace extends StatelessWidget {
  const TouristPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourist Place', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 50, 95, 140),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/clock-tower.jpg', fit: BoxFit.cover),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chiang Rai Clock Tower',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Chiang Rai, Thailand',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Color.fromARGB(255, 240, 65, 50)),
                    Text('559'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.call, color: Colors.blue, size: 25),
                    Text('CALL', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.directions, color: Colors.blue, size: 25),
                    Text('ROUTE', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share, color: Colors.blue, size: 25),
                    Text('SHARE', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
