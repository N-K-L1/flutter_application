import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    debugPrint('Button Pressed');
                  },
                  icon: Icon(Icons.volume_up, color: Colors.red),
                ),
                Ink(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.android, color: Colors.white),
                  ),
                ),
                SizedBox(width: 8),
                Ink(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.android, color: Colors.green),
                  ),
                ),
              ],
            ),
            OverflowBar(
              children: [
                OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
                SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  child: Text('OutlinedButton'),
                ),
              ],
            ),
            Wrap(
              children: [
                TextButton(onPressed: () {}, child: Text('TextButton')),
                SizedBox(width: 8),
                ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
                SizedBox(width: 8),
                FilledButton(onPressed: () {}, child: Text('FilledButton')),
                SizedBox(width: 8),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('FilledButton'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
