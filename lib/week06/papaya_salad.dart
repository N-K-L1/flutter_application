import 'package:flutter/material.dart';

class PapayaSalad extends StatelessWidget {
  const PapayaSalad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cooking Recipes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(103, 80, 164, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            const Text(
              'Papaya Salad',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Row with description (left) and image (right)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: description with border
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(103, 80, 164, 1),
                      ),
                    ),
                    child: const Text(
                      'Lorem ipsum dolor sit amet consectetur adipiscing elit. '
                      'Soluta ducimus in modi illo ad ipsa non officiis. '
                      'Ea placeat necessitatibus in aliquid ullam quasi porro '
                      'vel dolores, dignissimos quisquam aspernatur.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Right: image and rating
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      // Image
                      Image.asset(
                        'assets/images/salad.jpg',
                        height: 140,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 8),

                      // Stars + review count
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.black),
                        ],
                      ),
                      const Text("3128 reviews"),
                      const SizedBox(height: 16),
                      // Prep, Cook, Feeds row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          // Prep
                          Column(
                            children: [
                              Icon(
                                Icons.timelapse_outlined,
                                color: Colors.brown,
                              ),
                              Text(
                                "PREP:",
                                style: TextStyle(color: Colors.brown),
                              ),
                              Text(
                                "5 mins",
                                style: TextStyle(color: Colors.brown),
                              ),
                            ],
                          ),
                          // Cook
                          Column(
                            children: [
                              Icon(Icons.timer_outlined, color: Colors.red),
                              Text(
                                "COOK:",
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                "10 mins",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          // Feeds
                          Column(
                            children: [
                              Icon(Icons.restaurant, color: Colors.black),
                              Text("FEEDS:"),
                              Text("1-3"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
