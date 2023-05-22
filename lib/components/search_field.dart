import 'package:flutter/material.dart';
import 'package:spotted/ui/typo.dart';
import '../assets/colors.dart';

class SearchField extends StatefulWidget {
  final VoidCallback onPressedFilter;

  const SearchField({required this.onPressedFilter, Key? key}) : super(key: key);

  @override
  SearchFieldState createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {




  bool _isSearching = false;
  int _selectedImageIndex = 0;

  List<String> sportImages = [
    'skateboard.png',
    'bmx.png',
    'street_workout.png',
    'parkour.png',
    'vtt.png',
  ];

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
          Image.asset('lib/assets/images/logo_sport/$imageFileName',
              height: 32.0, width: 32.0),
          const SizedBox(height: 5.0),
          Text(
            text,
            style: TextStyle(
              color: _selectedImageIndex == index ? Colors.red : Colors.black,
              fontSize: 13.0,
            ),
          ),
          const SizedBox(height: 9.0),
          Opacity(
            opacity: _selectedImageIndex == index ? 1.0 : 0.0,
            child: Container(
              height: 3.0,
              width: 60.0,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }


@override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          children: [
          const SizedBox(height: 35.0),
          Container(
            height: 65.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
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
                  const SizedBox(width: 10.0),
                  const Icon(Icons.search, color: CustomColors.black),
                  const SizedBox(width: 10.0),
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
                              const SizedBox(height: 5.0),
                              Text(
                                'Une adresse ∙ une ville ∙ un sport ∙ ...',
                                style: CustomTextStyle.subtitle(),
                              ),
                            ],
                                       ),
                  ),
              GestureDetector(
    onTap: widget.onPressedFilter,  // Accéder à onPressedFilter via widget
    child: Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Image.asset(
        'lib/assets/images/icons/filter_icon.png',
        width: 40.0,
        height: 40.0,
      ),
    ),
  ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20.0),
      
      Column(
        children: [
          Container(
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
          ),
          ],
        ),
         Positioned(
                left: 0,
                right: 0,
                top: -10,
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        CustomColors.red.withOpacity(0.12),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
      ],
    ),
  ),
);
}
}