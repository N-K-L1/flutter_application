import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  const DropDownDemo({super.key});

  @override
  State<DropDownDemo> createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  int ddValue = 0;
  List fruits = ['Apple', 'Banana', 'Orange'];

  void updateDropdown(int? value) {
    setState(() {
      ddValue = value!;
    });
  }

  List<DropdownMenuItem<int>> createDropdown() {
    return List.generate(
      fruits.length,
      (index) => DropdownMenuItem(value: index, child: Text(fruits[index])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DropdownButton(
              value: ddValue,
              items: createDropdown(),
              onChanged: updateDropdown,
            ),
            Text('You chosed: $ddValue'),
          ],
        ),
      ),
    );
  }
}
