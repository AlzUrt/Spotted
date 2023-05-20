import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';
import 'package:padsou/views/map.dart';
import 'package:padsou/views/accueil.dart';
import 'package:padsou/components/search_field.dart';
import 'package:padsou/views/spotList.dart';
// Exemple de page avec un bouton qui modifie _currentIndex
class FirstPage extends StatefulWidget {
  const FirstPage({Key? key, required this.currentIndexSetter}) : super(key: key);

  final Function(int) currentIndexSetter;

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Mettre à jour _currentIndex à l'index de la page souhaitée
            widget.currentIndexSetter(1); // Par exemple, pour la page Favoris
          },
          child: const Text('Aller à la page Favoris'),
        ),
      ),
    );
  }
}
