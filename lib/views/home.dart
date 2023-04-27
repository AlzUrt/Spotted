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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            height: 222.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
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
                    Image.asset('lib/assets/images/logo_sport/skateboard.png'),
                    Image.asset('lib/assets/images/logo_sport/bmx.png'),
                    Image.asset('lib/assets/images/logo_sport/street_workout.png'),
                    Image.asset('lib/assets/images/logo_sport/parkour.png'),
                    Image.asset('lib/assets/images/logo_sport/vtt.png'),
                  ],
                ),




                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     TopSelectSportItem(
                  //       icon: Icon(Icons.home),
                  //       label: 'Accueil',
                  //       isSelected: true,
                  //       onTap: () {},
                  //     ),
                  //     TopSelectSportItem(
                  //       icon: Icon(Icons.favorite),
                  //       label: 'Favoris',
                  //       isSelected: false,
                  //       onTap: () {},
                  //     ),
                  //     TopSelectSportItem(
                  //       icon: Icon(Icons.rss_feed),
                  //       label: 'Feed',
                  //       isSelected: false,
                  //       onTap: () {},
                  //     ),
                  //     TopSelectSportItem(
                  //       icon: Icon(Icons.chat),
                  //       label: 'Chat',
                  //       isSelected: false,
                  //       onTap: () {},
                  //     ),
                  //     TopSelectSportItem(
                  //       icon: Icon(Icons.person),
                  //       label: 'Profil',
                  //       isSelected: false,
                  //       onTap: () {},
                  //     ),
                  //   ],
                  // ),





              ],
            ),
          ),
        ],
      ),
    );
  }
}
