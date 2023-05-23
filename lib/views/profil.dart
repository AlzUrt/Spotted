import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  late String userName = '';
  bool isDataLoaded = false; // État pour vérifier si les données ont été chargées
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
                    if (isDataLoaded) // Affiche le texte uniquement lorsque les données ont été chargées
                      Text(
                        'Bonjour $userName',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.black,
                        ),
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
