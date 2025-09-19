import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class BakingApp extends StatelessWidget {
  const BakingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Image.asset('assets/images/baking.jpg', fit: BoxFit.cover),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Baking lessons".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Master the art of baking".toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Spacer(),
                FilledButton.icon(
                  onPressed: () {},
                  style: FilledButton.styleFrom(backgroundColor: primaryColor),
                  label: Text(
                    "Start learning".toUpperCase(),
                    style: TextStyle(color: bgColor),
                  ),
                  icon: Icon(Icons.arrow_forward, color: bgColor),
                  iconAlignment: IconAlignment.end,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
