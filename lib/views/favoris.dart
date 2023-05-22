import 'package:flutter/material.dart';


class Favoris extends StatefulWidget {
  const Favoris({Key? key}) : super(key: key);
  @override
  AddPlanState createState() => AddPlanState();
}

class AddPlanState extends State<Favoris> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: const[
          SingleChildScrollView(


          ),
        ],
      ),
    );
  }
}
