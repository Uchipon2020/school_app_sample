import 'package:flutter/material.dart';
import 'package:school_app_sample/screens/data_list.dart';

import 'sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School data',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: DataList(),
    );
  }
}

