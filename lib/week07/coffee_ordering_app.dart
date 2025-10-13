import 'package:flutter/material.dart';

class CoffeeOrderingApp extends StatefulWidget {
  const CoffeeOrderingApp({super.key});

  @override
  State<CoffeeOrderingApp> createState() => _CoffeeOrderingAppState();
}

class _CoffeeOrderingAppState extends State<CoffeeOrderingApp> {
  bool hotorcold = false;
  double sugar = 0;

  void updateHotorCold(bool? value) {
    setState(() {
      hotorcold = value!;
    });
  }

  void updateSugar(double? value) {
    setState(() {
      sugar = value!;
    });
  }

  void orderCoffee() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Your Order'),
          content: Text(
            '${hotorcold ? "Cold" : "Hot"} coffee with ${sugar == 0
                ? "no"
                : sugar == 0.5
                ? "less"
                : "normal"} sugar',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MFU Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 103, 80, 164),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Your Order', style: TextStyle(fontSize: 20)),

                Row(
                  children: [
                    Text('Type'),
                    SizedBox(width: 184),
                    Text('Hot'),
                    Switch(value: hotorcold, onChanged: updateHotorCold),
                    Text('Cold'),
                  ],
                ),

                Row(
                  children: [
                    Text('Sugar level'),
                    Slider(
                      value: sugar,
                      divisions: 2,
                      label: sugar == 0
                          ? "none"
                          : sugar == 0.5
                          ? "less"
                          : "normal",
                      onChanged: updateSugar,
                    ),
                    Text('Normal'),
                  ],
                ),
                FilledButton(
                  onPressed: orderCoffee,
                  child: const Text('ORDER'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
