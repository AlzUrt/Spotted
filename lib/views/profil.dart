import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotted/components/button.dart';
import 'package:spotted/views/login.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  late String userName = '';
  bool isDataLoaded = false; // État pour vérifier si les données ont été chargées
  bool isUserLoggedIn = false; // État pour vérifier si l'utilisateur est connecté
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  String getCurrentUserUID() {
    User? user = _auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      return uid;
    }
    return '';
  }

  void getUserData() async {
    final String userId = getCurrentUserUID();
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (snapshot.exists) {
      setState(() {
        userName = (snapshot.data() as Map<String, dynamic>)['name'] ?? '';
        isDataLoaded = true; // Les données ont été chargées avec succès
        isUserLoggedIn = true; // L'utilisateur est connecté
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    if (isDataLoaded && isUserLoggedIn) // Affiche le texte uniquement lorsque les données ont été chargées et l'utilisateur est connecté
                      Text(
                        'Bonjour $userName',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.black,
                        ),
                      ),
                    if (!isUserLoggedIn) // Affiche le bouton "Connectez-vous" si l'utilisateur n'est pas connecté
                                    CustomButton(
  buttonText: 'Connectez-vous',
  buttonColor: CustomColors.red,
  textColor: Colors.white,
  onPressed: () {
    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
  },
),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
