import 'package:flutter/material.dart';
// Exemple de page avec un bouton qui modifie _currentIndex
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.currentIndexSetter}) : super(key: key);

  final Function(int) currentIndexSetter;

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<SecondPage> {
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
          child: const Text('Aller à la page Favoris 2 '),
        ),
      ),
    );
  }
}
