import 'package:flutter/material.dart';

class Design2 extends StatelessWidget {
  const Design2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  'https://icons.iconarchive.com/icons/diversity-avatars/avatars/128/batman-icon.png',
                ),
              ),
            ),
            Divider(color: Colors.grey[600], height: 60),
            Text('Name', style: TextStyle(color: Colors.grey, fontSize: 16)),
            Text(
              'Bruce Wayne',
              style: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
            SizedBox(height: 16),
            Text('Age', style: TextStyle(color: Colors.grey, fontSize: 16)),
            Text('22', style: TextStyle(color: Colors.yellow, fontSize: 22)),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.email, color: Colors.grey[400]),
                SizedBox(width: 8),
                Text(
                  'bruce.wayne@abc.com',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
