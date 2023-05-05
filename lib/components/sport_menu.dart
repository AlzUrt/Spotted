import 'package:flutter/material.dart';

class SportMenu extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  SportMenu({required this.selectedIndex, required this.onItemSelected});

  @override
  _SportMenuState createState() => _SportMenuState();
}

class _SportMenuState extends State<SportMenu> {
  List<String> sportImages = [
    'skateboard.png',
    'bmx.png',
    'street_workout.png',
    'parkour.png',
    'vtt.png',
  ];

  @override
 Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildMenuItem(0, 'Skateboard'),
          buildMenuItem(1, 'BMX'),
          buildMenuItem(2, 'Street Workout'),
          buildMenuItem(3, 'Parkour'),
          buildMenuItem(4, 'VTT'),
        ],
      ),
    );
  }

  Widget buildMenuItem(int index, String text) {
    String imageFileName = sportImages[index];
    return GestureDetector(
      onTap: () {
        widget.onItemSelected(index);
      },
      child: Column(
        children: [
          Image.asset('lib/assets/images/logo_sport/$imageFileName'),
          SizedBox(height: 5.0),
          Text(
            text,
            style: TextStyle(
              color: widget.selectedIndex == index ? Colors.red : Colors.black,
            ),
          ),
          SizedBox(height: 11.0), // Espace pour la barre rouge
          Opacity(
            opacity: widget.selectedIndex == index ? 1.0 : 0.0,
            child: Container(
              height: 3.0, // Hauteur de la barre rouge
              width: 60.0, // Largeur de la barre rouge
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}