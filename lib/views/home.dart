import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';
import 'package:padsou/ui/typo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                SizedBox(height: 70.0), // Spacer for Search Bar
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
                  child: Row(
                    children: [
                      SizedBox(width: 10.0),
                      Icon(Icons.search, color: CustomColors.black),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Spot',
                            hintStyle: CustomTextStyle.title(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0), // Spacer for Images Row
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
