import 'package:flutter/material.dart';
import 'package:padsou/views/plans.dart';
import 'package:padsou/views/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Padsou',
      home: Start(),
    );
  }
}
