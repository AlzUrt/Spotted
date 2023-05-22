import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';
import 'package:spotted/views/login.dart';
import 'package:spotted/views/plans.dart';
import 'package:spotted/views/register.dart';
import 'dart:async';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  @override
  StartState createState() => StartState();
}

class StartState extends State<Start> {
  PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
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
        MaterialPageRoute(builder: (context) => const Plans()),
      );
    } else {
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  skip() {
    // go to page 4
    _pageController.animateToPage(
      4,
      duration: const Duration(milliseconds: 300),
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
              Center(
                child: Image.asset(
                  'lib/assets/images/icons/logo.png',
                  height: 400,
                  width: 200,
                ),
              ),
              Stack(
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
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Des spots qui vous',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'correspondent',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: const [
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
                            padding: const EdgeInsets.only(top: 40),
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
                                const SizedBox(width: 10),
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.grey,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    skip();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.white,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.04161),
                                    ),
                                    fixedSize: const Size(150, 50),
                                  ),
                                  child: const Text(
                                    'Passer',
                                    style: TextStyle(
                                      color: CustomColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    changePage();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.red,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.04161),
                                    ),
                                    fixedSize: const Size(150, 50),
                                  ),
                                  child: const Text(
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
              Stack(
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
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Partage des vidéo',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'avec la communauté',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: const [
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
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.grey,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 23,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: CustomColors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    skip();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.white,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.04161),
                                    ),
                                    fixedSize: const Size(150, 50),
                                  ),
                                  child: const Text(
                                    'Passer',
                                    style: TextStyle(
                                      color: CustomColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    changePage();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.red,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.04161),
                                    ),
                                    fixedSize: const Size(150, 50),
                                  ),
                                  child: const Text(
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
              Stack(
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
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Propose tes spots ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'préférés',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: const [
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
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.grey,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.grey,
                                  ),
                                ),
                                const SizedBox(width: 10),
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
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    skip();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.white,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.04161),
                                    ),
                                    fixedSize: const Size(150, 50),
                                  ),
                                  child: const Text(
                                    'Passer',
                                    style: TextStyle(
                                      color: CustomColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    changePage();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.red,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.04161),
                                    ),
                                    fixedSize: const Size(150, 50),
                                  ),
                                  child: const Text(
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
              Stack(
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
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Bienvenue !',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            width: 320,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
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
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Image.asset(
                                    'lib/assets/images/icons/facebook.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'S’inscrire avec Facebook',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            width: 320,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
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
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Image.asset(
                                    'lib/assets/images/icons/apple.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'S’inscrire avec Apple',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()),
                              );
                            },
                            child: Container(
                              width: 350,
                              height: 60,
                              decoration: BoxDecoration(
                                color: CustomColors.red,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                    blurRadius: 15.6692,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(4.61772),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
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
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
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
                                        builder: (context) => const Login()),
                                  );
                                },
                                child: const Text(
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
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Plans()),
                                  );
                                },
                                child: const Text(
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
            ],
          ),
        ],
      ),
    );
  }
}
