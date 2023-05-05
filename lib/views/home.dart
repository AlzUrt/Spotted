import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';
import 'package:padsou/views/map.dart';
import 'package:padsou/views/accueil.dart';
import 'package:padsou/components/search_field.dart';

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
            child: SearchField(),
          ),

          Positioned(
            left: 0,
            right: 0,
            // bottom: 90,
            top: 255,

            child: Container(
              color: Colors.brown,
              margin: EdgeInsets.symmetric(horizontal: 132),
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
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.black),
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
                                padding: const EdgeInsets.all(12.0),
                                child: Text('First'),
                              ),
                            ),
                          ),
                        ),

                        // Add some spacing between the buttons
                        SizedBox(width: 16),

                        // Add the second button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.black),
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
                                padding: const EdgeInsets.all(12.0),
                                child: Text('Second'),
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
