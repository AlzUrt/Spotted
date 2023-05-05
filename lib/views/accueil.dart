import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';


class SecondPage extends StatefulWidget {
  @override
  ShowAccuiel createState() => ShowAccuiel();
}

class ShowAccuiel extends State<SecondPage> {
  int _currentStep = 1;


  void _nextStep() {
    setState(() {
      _currentStep++; // incrémente l'étape actuelle
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          SingleChildScrollView(


          ),
        ],
      ),
    );
  }
}
