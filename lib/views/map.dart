import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';


class FirstPage extends StatefulWidget {
  @override
  ShowMap createState() => ShowMap();
}

class ShowMap extends State<FirstPage> {
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
