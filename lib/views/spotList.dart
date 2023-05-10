
import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';
import 'package:padsou/views/map.dart';
import 'package:padsou/views/accueil.dart';
import 'package:padsou/components/search_field.dart';

class SpotList extends StatefulWidget {
  @override
  _SpotListState createState() => _SpotListState();
}

class _SpotListState extends State<SpotList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: SearchField(),
          ),
          Positioned(
            left: 16,
            top: 256,
            child: Text(
              "À proximité",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColors.black,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            // bottom: 90,
            top: 720,

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 138),
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Add the first button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.3),
                            color: Colors.red,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Navigate to the first page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FirstPage()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Carte',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Image.asset(
                                      'lib/assets/images/icons/terre.png',
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Add some spacing between the buttons
                        SizedBox(width: 16),

                        // Add the second button
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.3),
                            color: Colors.red,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Navigate to the second page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Image.asset(
                                  'lib/assets/images/icons/plus.png',
                                  width: 150,
                                  height: 150,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
