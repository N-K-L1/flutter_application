import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int gValue = 0;
  List fruits = ['Apple', 'Banana', 'Orange'];

  void updateRadio(int? value) {
    setState(() {
      gValue = value!;
    });
  }

  // List<Widget> createRadios() {
  //   List<Widget> widgets = [];
  //   for (int i = 0; i < fruits.length; i++) {
  //     widgets.add(Radio(value: i, groupValue: gValue, onChanged: updateRadio));
  //     widgets.add(Text(fruits[i]));
  //   }
  //   return widgets;
  // }

  List<Widget> createRadios() {
    List<Widget> widgets = List.generate(
      fruits.length,
      (index) =>
          Radio(value: index, groupValue: gValue, onChanged: updateRadio),
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(children: createRadios()),
            Text('You chosed: $gValue'),
          ],
        ),
      ),
    );
  }
}
