import 'package:flutter/material.dart';
import 'package:padsou/ui/typo.dart';
import 'package:padsou/components/sport_menu.dart';

import '../assets/colors.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool _isSearching = false;
  int _selectedImageIndex = 0;

  List<String> sportImages = [
    'skateboard.png',
    'bmx.png',
    'street_workout.png',
    'parkour.png',
    'vtt.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0,
          color: Colors.white,
        ),
        Container(
          height: 80,
          color: Colors.white,
          
          child: Column(
            children: [
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
                            width: 40.0, // adaptez la taille selon vos besoins
                            height: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 20.0),
        // Container(
        //   height: 20.0,
        //   color: Colors.white,
        // ),
        SportMenu(
          selectedIndex: _selectedImageIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedImageIndex = index;
            });
          },
        ),
      ],
    );
  }
}
