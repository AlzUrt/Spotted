import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';

class Chat extends StatefulWidget {
  @override
  AccueilState createState() => AccueilState();
}

class AccueilState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.red,
      body: Stack(
        children: [
          SingleChildScrollView(
            
          ),
        ],
      ),
    );
  }
}
