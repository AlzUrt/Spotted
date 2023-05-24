import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';
import 'package:spotted/views/plans.dart';
import 'package:spotted/components/button.dart';
class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);
  @override
  FilterState createState() => FilterState();
}

class FilterState extends State<Filter> {
  double sliderValue = 1;
  List<String> sportImages = [
    'skateboard.png',
    'bmx.png',
    'workout.png',
    'parkour.png',
    'bike.png',
  ];
  Widget buildMenuItem(int index, String text) {
    String imageFileName = sportImages[index];
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Image.asset('lib/assets/images/logo_sport/$imageFileName',
              height: 27.0, width: 27.0),
          const SizedBox(height: 5.0),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: CustomColors.white,
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Plans()),
                      );
                    },
                    child: Image.asset(
                      'lib/assets/images/icons/croix.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  // SizedBox(height: 15), // Marge supérieure
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 11.0),
                        child: buildMenuItem(0, 'Skateboard'),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: buildMenuItem(1, 'BMX'),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: buildMenuItem(2, 'Street Workout'),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: buildMenuItem(3, 'Parkour'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 11.0),
                        child: buildMenuItem(4, 'VTT'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30), // Marge supérieure
                  Center(
                    child: Container(
                      height: 0.5,
                      width: 312,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30), // Marge supérieure
                  Center(
                    child: Container(
                      width: 314,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 13.7143,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(4.04161),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Localisation du spot',
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Image.asset(
                              'lib/assets/images/icons/loca.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Espacement de 50 pixels
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Distance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 335,
                      child: Column(
                        children: [
                          SliderTheme(
                            data: const SliderThemeData(
                              trackHeight: 1.0,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 8.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 16.0),
                            ),
                            child: Slider(
                              min: 0,
                              max: 4,
                              divisions: 4,
                              value: sliderValue,
                              onChanged: (value) {
                                setState(() {
                                  sliderValue = value;
                                });
                              },
                              activeColor: CustomColors.red,
                            ),
                          ),
                          // SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '1km',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '5km',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '10km',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '20km',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '50km',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Marge supérieure
                  Center(
                    child: Container(
                      height: 0.5,
                      width: 312,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: [
                        const Text(
                          'Difficulté',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            Image.asset(
                              'lib/assets/images/icons/rond.png',
                              height: 24,
                              width: 24,
                            ),
                            Image.asset(
                              'lib/assets/images/icons/rond.png',
                              height: 24,
                              width: 24,
                            ),
                            Image.asset(
                              'lib/assets/images/icons/rond.png',
                              height: 24,
                              width: 24,
                            ),
                            Image.asset(
                              'lib/assets/images/icons/rond.png',
                              height: 24,
                              width: 24,
                            ),
                            Image.asset(
                              'lib/assets/images/icons/rond.png',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: [
                        const Text(
                          'Note',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            Image.asset(
                              'lib/assets/images/icons/etoiles.png',
                              height: 24,
                              width: 24,
                            ),
                            Image.asset(
                              'lib/assets/images/icons/etoiles.png',
                              height: 24,
                              width: 24,
                            ),
                            Image.asset(
                              'lib/assets/images/icons/etoiles.png',
                              height: 24,
                              width: 24,
                            ),
                            Image.asset(
                              'lib/assets/images/icons/etoiles.png',
                              height: 24,
                              width: 24,
                            ),
                            Image.asset(
                              'lib/assets/images/icons/etoiles.png',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30), // Marge supérieure
                  Center(
                    child: Container(
                      height: 0.5,
                      width: 312,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: [
                        const Text(
                          'Spots gratuits uniquement',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Image.asset(
                          'lib/assets/images/icons/carre.png',
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: [
                        const Text(
                          'Eau à disposition',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Image.asset(
                          'lib/assets/images/icons/carre.png',
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: [
                        const Text(
                          'Prises électriques à disposition',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Image.asset(
                          'lib/assets/images/icons/carre.png',
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
  buttonText: 'Rechercher',
  buttonColor: CustomColors.red,
  textColor: Colors.white,
  onPressed: () {
    // Logique à exécuter lors du clic sur le bouton
  },
),

                ],
              ),
            ),
        ),
      ),
    );
  }
}
