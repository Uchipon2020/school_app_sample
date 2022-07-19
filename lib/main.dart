import 'package:flutter/material.dart';

import 'sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School data',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SignInScreen(),
    );
  }
}

