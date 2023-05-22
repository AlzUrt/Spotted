import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';

class Chat extends StatefulWidget {
  
  const Chat({Key? key}) : super(key: key);
  @override
  AccueilState createState() => AccueilState();
}

class AccueilState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.red,
      body: Stack(
        children:const [
          SingleChildScrollView(
            
          ),
        ],
      ),
    );
  }
}
