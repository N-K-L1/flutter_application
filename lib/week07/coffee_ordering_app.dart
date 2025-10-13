import 'package:flutter/material.dart';

class CoffeeOrderingApp extends StatefulWidget {
  const CoffeeOrderingApp({super.key});

  @override
  State<CoffeeOrderingApp> createState() => _CoffeeOrderingAppState();
}

class _CoffeeOrderingAppState extends State<CoffeeOrderingApp> {
  int coffee = 0;
  String thankyou = '';
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

  void updateCoffee(int? value) {
    setState(() {
      coffee = value!;
    });
  }

  void orderCoffee() async {
    // --- calculate base price ---
    int price = 0;
    String coffeeName = '';
    String imageUrl = '';

    switch (coffee) {
      case 0:
        price = 35;
        coffeeName = 'Latte';
        imageUrl =
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQby11lcOq_8WRxqCAvx6JtVe-N6YxNEd5o9A&s';
        break;
      case 1:
        price = 30;
        coffeeName = 'Americano';
        imageUrl =
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgiDaLTqfQGyvr15UyXFuELx5pKXDaCC_kOQ&s';
        break;
      case 2:
        price = 40;
        coffeeName = 'Cappuccino';
        imageUrl =
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvVfQeqNIQZ_S-molavVjYO5p5Y2IsbiyqTg&s';
        break;
    }

    // --- add 5 baht if cold ---
    if (hotorcold) {
      price += 5;
    }

    // --- sugar level description ---
    String sugarText = sugar == 0
        ? "no"
        : sugar == 0.5
        ? "less"
        : "normal";

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Your Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl, width: 120),
              const SizedBox(height: 10),
              Text(
                '${hotorcold ? "Cold" : "Hot"} $coffeeName with $sugarText sugar.\nPrice = $price baht',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  thankyou = '';
                });
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  thankyou = 'Thank you for your order!';
                });
              },
              child: const Text('Ok'),
            ),
          ],
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
        backgroundColor: const Color.fromARGB(255, 103, 80, 164),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text('Your Order', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 10),

                // --- Coffee selection ---
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Coffee',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: coffee,
                          onChanged: updateCoffee,
                        ),
                        const Text('Latte 35'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: coffee,
                          onChanged: updateCoffee,
                        ),
                        const Text('Americano 30'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: coffee,
                          onChanged: updateCoffee,
                        ),
                        const Text('Cappuccino 40'),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // --- Hot or Cold ---
                Row(
                  children: [
                    const Text(
                      'Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 150),
                    const Text('Hot'),
                    Switch(value: hotorcold, onChanged: updateHotorCold),
                    const Text('Cold (+5)'),
                  ],
                ),

                const SizedBox(height: 10),

                // --- Sugar level ---
                Row(
                  children: [
                    const Text(
                      'Sugar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 15),
                    const Text('None'),
                    Expanded(
                      child: Slider(
                        value: sugar,
                        divisions: 2,
                        label: sugar == 0
                            ? "none"
                            : sugar == 0.5
                            ? "less"
                            : "normal",
                        onChanged: updateSugar,
                      ),
                    ),
                    const Text('Normal'),
                  ],
                ),

                const SizedBox(height: 15),
                FilledButton(
                  onPressed: orderCoffee,
                  child: const Text('ORDER'),
                ),
                const SizedBox(height: 20),
                Text(
                  thankyou,
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
