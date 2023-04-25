import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';


class Favoris extends StatefulWidget {
  @override
  AddPlanState createState() => AddPlanState();
}

class AddPlanState extends State<Favoris> {
  int _currentStep = 1;


  void _nextStep() {
    setState(() {
      _currentStep++; // incrémente l'étape actuelle
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          SingleChildScrollView(


          ),
        ],
      ),
    );
  }
}
