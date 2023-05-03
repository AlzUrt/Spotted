import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';
import 'package:padsou/ui/typo.dart';
// import 'package:padsou/components/selectSport.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isSearching = false;
  static const int _defaultSelectedImageIndex = -1;
  int _selectedImageIndex = _defaultSelectedImageIndex;

  List<String> sportImages = [
    'skateboard.png',
    'bmx.png',
    'street_workout.png',
    'parkour.png',
    'vtt.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 222.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: CustomColors.red.withOpacity(0.12),
                  spreadRadius: 4,
                  blurRadius: 22,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 70.0),
                Container(
                  height: 65.0,
                  margin: EdgeInsets.symmetric(horizontal: 35.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSearching = true;
                      });
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 10.0),
                        Icon(Icons.search, color: CustomColors.black),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: _isSearching
                              ? TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '',
                                    hintStyle: CustomTextStyle.title(),
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spot',
                                      style: CustomTextStyle.title(),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      'Une adresse ∙ une ville ∙ un sport ∙ ...',
                                      style: CustomTextStyle.subtitle(),
                                    ),
                                  ],
                                ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              'lib/assets/images/icons/filter_icon.png',
                              width:
                                  40.0, // adaptez la taille selon vos besoins
                              height: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildMenuItem(0, 'Skateboard'),
                    buildMenuItem(1, 'BMX'),
                    buildMenuItem(2, 'Street Workout'),
                    buildMenuItem(3, 'Parkour'),
                    buildMenuItem(4, 'VTT'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(int index, String text) {
    String imageFileName = sportImages[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedImageIndex = index;
        });
      },
      child: Column(
        children: [
          Image.asset('lib/assets/images/logo_sport/$imageFileName'),
          SizedBox(height: 5.0),
          Text(
            text,
            style: TextStyle(
              color: _selectedImageIndex == index ? Colors.red : Colors.black,
            ),
          ),
          SizedBox(height: 11.0), // Espace pour la barre rouge
          Opacity(
            opacity: _selectedImageIndex == index ? 1.0 : 0.0,
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
