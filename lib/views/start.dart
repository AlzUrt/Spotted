import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';
import 'package:padsou/views/login.dart';
import 'package:padsou/views/plans.dart';
import 'package:padsou/views/register.dart';

import 'dart:async';

import 'package:padsou/views/spotList.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 2), () {
      setState(() {
        _timer?.cancel();
        changePage();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void changePage() {
    int currentPage = _pageController.page!.round();
    int nextPage = currentPage == 4 ? 0 : currentPage + 1;
    if (nextPage == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Plans()),
      );
    } else {
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  skip() {
    // go to page 4
    _pageController.animateToPage(
      4,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: CustomColors.white,
          ),
          PageView(
            controller: _pageController,
            children: <Widget>[
              Container(
                  child: Center(
                child: Image.asset(
                  'lib/assets/images/icons/logo.png',
                  height: 400,
                  width: 200,
                ),
              )),
              Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'lib/assets/images/image/start1.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 520, // Position verticale
                      child: Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // La largeur prend toute la largeur de l'écran
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Des spots qui vous',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'correspondent',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                    'Trouver et enregistrez',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    ' de nouveaux spots de sports urbains !',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 23,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: CustomColors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomColors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      skip();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: CustomColors.white,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.04161),
                                      ),
                                      fixedSize: Size(150, 50),
                                    ),
                                    child: Text(
                                      'Passer',
                                      style: TextStyle(
                                        color: CustomColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      changePage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: CustomColors.red,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.04161),
                                      ),
                                      fixedSize: Size(150, 50),
                                    ),
                                    child: Text(
                                      'Suivant',
                                      style: TextStyle(
                                        color: CustomColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
              ),
              Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'lib/assets/images/image/start2.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 520, // Position verticale
                      child: Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // La largeur prend toute la largeur de l'écran
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Partage des vidéo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'avec la communauté',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                    'Rends toi dans le Feed pour voir les',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    ' vidéos de la communauté Spotted',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomColors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 23,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: CustomColors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      skip();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: CustomColors.white,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.04161),
                                      ),
                                      fixedSize: Size(150, 50),
                                    ),
                                    child: Text(
                                      'Passer',
                                      style: TextStyle(
                                        color: CustomColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      changePage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: CustomColors.red,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.04161),
                                      ),
                                      fixedSize: Size(150, 50),
                                    ),
                                    child: Text(
                                      'Suivant',
                                      style: TextStyle(
                                        color: CustomColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
              ),
              Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'lib/assets/images/image/start3.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 520, // Position verticale
                      child: Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // La largeur prend toute la largeur de l'écran
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Propose tes spots ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'préférés',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                    'Ajoute de nouveaux spots sur la map',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    ' pour le partager à toute la communauté',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomColors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomColors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 23,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: CustomColors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      skip();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: CustomColors.white,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.04161),
                                      ),
                                      fixedSize: Size(150, 50),
                                    ),
                                    child: Text(
                                      'Passer',
                                      style: TextStyle(
                                        color: CustomColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      changePage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: CustomColors.red,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.04161),
                                      ),
                                      fixedSize: Size(150, 50),
                                    ),
                                    child: Text(
                                      'Suivant',
                                      style: TextStyle(
                                        color: CustomColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
              ),
              Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'lib/assets/images/image/start4.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 500,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Bienvenue !',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(height: 25),
                            Container(
                              width: 320,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                    blurRadius: 15.6692,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(4.61772),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Image.asset(
                                      'lib/assets/images/icons/facebook.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'S’inscrire avec Facebook',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            Container(
                              width: 320,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                    blurRadius: 15.6692,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(4.61772),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Image.asset(
                                      'lib/assets/images/icons/apple.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'S’inscrire avec Apple',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                              child: Container(
                                width: 350,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: CustomColors.red,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.15),
                                      blurRadius: 15.6692,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(4.61772),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'S’inscrire avec une adresse mail',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Vous avez déjà un compte ? ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                    );
                                  },
                                  child: Text(
                                    'Se connecter',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CustomColors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Plans()),
                                    );
                                  },
                                  child: Text(
                                    'Continuer sans compte',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CustomColors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
