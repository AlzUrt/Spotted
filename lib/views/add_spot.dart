import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';
import 'package:spotted/views/plans.dart';
import 'package:spotted/components/input.dart';
import 'package:spotted/components/button.dart';
class AddSpot extends StatefulWidget {
  const AddSpot({Key? key}) : super(key: key);
  @override
  AddSpotState createState() => AddSpotState();
}

class AddSpotState extends State<AddSpot> {
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
              const Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Text(
                  'Proposer un spot',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
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
              // Marge supérieure
              // Center(
              //   child: Container(
              //     width: 314,
              //     height: 55,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: const [
              //         BoxShadow(
              //           color: Color.fromRGBO(0, 0, 0, 0.15),
              //           blurRadius: 13.7143,
              //         ),
              //       ],
              //       borderRadius: BorderRadius.circular(4.04161),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: const [
              //         Expanded(
              //           child: TextField(
              //             decoration: InputDecoration(
              //               hintText: 'Nom du spot',
              //               border: InputBorder.none,
              //               contentPadding:
              //                   EdgeInsets.symmetric(horizontal: 30),
              //               hintStyle: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 30), // Marge supérieure
              // // Marge supérieure
              // Center(
              //   child: Container(
              //     width: 314,
              //     height: 55,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: const [
              //         BoxShadow(
              //           color: Color.fromRGBO(0, 0, 0, 0.15),
              //           blurRadius: 13.7143,
              //         ),
              //       ],
              //       borderRadius: BorderRadius.circular(4.04161),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: const [
              //         Expanded(
              //           child: TextField(
              //             decoration: InputDecoration(
              //               hintText: 'Localisation du spot',
              //               border: InputBorder.none,
              //               contentPadding:
              //                   EdgeInsets.symmetric(horizontal: 30),
              //               hintStyle: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Center(
  child: Column(
    children: [
      CustomInputField(hintText: 'Nom du spot'),
      const SizedBox(height: 30), // Marge supérieure
      CustomInputField(hintText: 'Localisation du spot'),
    ],
  ),
),

              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: 314,
                  height: 50,
                  decoration: BoxDecoration(
                    color: CustomColors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      'Séléctionner des photos',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30), // Marge supérieure
              // Marge supérieure
              Center(
                child: Container(
                  width: 314,
                  height: 190,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            hintText: 'Description détaillée du spot',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),
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
              CustomButton(
  buttonText: 'Proposer le spot',
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
