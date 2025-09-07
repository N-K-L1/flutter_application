import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //State variables
  String message = '';
  TextEditingController tcName = TextEditingController();
  TextEditingController tcPassword = TextEditingController();

  //Functions
  void updateText() {
    setState(() {
      if (tcName.text == "admin" && tcPassword.text == "1234") {
        message = 'Welcome admin';
      } else {
        message = 'Wrong username or password';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(40, 148, 236, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              controller: tcName,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              controller: tcPassword,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: updateText,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(40, 148, 236, 1),
            ),
            child: const Text('Login', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
          ),
        ],
      ),
    );
  }
}
