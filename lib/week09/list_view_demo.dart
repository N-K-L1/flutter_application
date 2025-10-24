import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  final List data = [
    {'icon': Icons.map, 'name': 'Map'},
    {'icon': Icons.album, 'name': 'Album'},
    {'icon': Icons.phone, 'name': 'Phone'},
  ];
  ListViewDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Demo')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(data[index]['icon']),
            title: Text(data[index]['name']),
            subtitle: const Text('Details'),
            trailing: const Icon(Icons.stars),
            onTap: () {
              // remove the previous snackbar if any
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              // show snackbar
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(data[index]['name'])));
            },
          );
        },
      ),
    );
  }
}
