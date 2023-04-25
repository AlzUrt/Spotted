import 'package:flutter/material.dart';
import 'package:padsou/components/navigationBarBottom.dart';
import 'package:padsou/views/favoris.dart';
import 'package:padsou/views/feed.dart';
import 'package:padsou/views/home.dart';
import 'package:padsou/views/chat.dart';
import 'package:padsou/views/profil.dart';


class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Favoris(),
    Feed(),
    Chat(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),



              child: NavigationBarBottom(
                
                initialIndex: _currentIndex,
                items: [


                  BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Ink(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              'lib/assets/images/icons/home.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                        label: 'Accueil',
                      ),



                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Ink(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'lib/assets/images/icons/coeur.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    label: 'Favoris',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Ink(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'lib/assets/images/icons/feed.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    label: 'Feed',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Ink(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'lib/assets/images/icons/chat.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Ink(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          'lib/assets/images/icons/profil.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    label: 'Profil',
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),




            ),
          ),
        ],
      ),
    );
  }
}
