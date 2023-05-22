import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);
  @override
  AccueilState createState() => AccueilState();
}

class AccueilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey,
      body: Stack(
        children:const  [
          SingleChildScrollView(
            
          ),
        ],
      ),
    );
  }
}
