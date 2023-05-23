import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              // Définir la taille du conteneur en fonction de la taille de l'écran
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'lib/assets/images/gif/swag.gif', // Remplacez "assets/your_gif.gif" par le chemin de votre fichier GIF
                fit: BoxFit.cover, // Pour ajuster le GIF à la taille du conteneur
              ),
            ),
          ),
        ],
      ),
    );
  }
}
