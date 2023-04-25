import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';

class Profil extends StatefulWidget {
  @override
  AccueilState createState() => AccueilState();
}

class AccueilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey,
      body: Stack(
        children: [
          SingleChildScrollView(
            
          ),
        ],
      ),
    );
  }
}
