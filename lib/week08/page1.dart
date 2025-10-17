import 'package:flutter/material.dart';
import 'package:flutter_application/week08/fruit.dart';
import 'package:flutter_application/week08/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Align(
        alignment: Alignment.topCenter,
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page2(
                  fruit: Fruit('apple', 15, ['10 Oct', '20 Oct'], 'Thailand'),
                ),
              ),
            );
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}
