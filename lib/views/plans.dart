import 'package:flutter/material.dart';
import 'package:spotted/components/navigation_bar_bottom.dart';
import 'package:spotted/views/favoris.dart';
import 'package:spotted/views/feed.dart';
import 'package:spotted/views/chat.dart';
import 'package:spotted/views/profil.dart';
import 'package:spotted/views/spot_list.dart';

class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  PlansState createState() => PlansState();
}

class PlansState extends State<Plans> {
  int _currentIndex = 0;
  List<Widget> _pages = []; 

  @override
  void initState() {
    super.initState();
    _pages = [
      const SpotList(),
      const Favoris(),
      const Feed(),
      const Chat(),
      const Profil(),
    ];
  }

  void setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
                  // BottomNavigationBarItem(
                  //   icon: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //     child: Ink(
                  //       padding: const EdgeInsets.all(8),
                  //       child: Image.asset(
                  //         'lib/assets/images/icons/FirstPage.png',
                  //         height: 24,
                  //         width: 24,
                  //       ),
                  //     ),
                  //   ),
                  //   label: 'FirstPage',
                  // ),
                  //                   BottomNavigationBarItem(
                  //   icon: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //     child: Ink(
                  //       padding: const EdgeInsets.all(8),
                  //       child: Image.asset(
                  //         'lib/assets/images/icons/SecongPage.png',
                  //         height: 24,
                  //         width: 24,
                  //       ),
                  //     ),
                  //   ),
                  //   label: 'SecongPage',
                  // ),
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
