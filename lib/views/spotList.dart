import 'package:flutter/material.dart';
import 'package:padsou/assets/colors.dart';
import 'package:padsou/views/map.dart';
import 'package:padsou/views/accueil.dart';
import 'package:padsou/components/search_field.dart';

class SpotList extends StatefulWidget {
  @override
  _SpotListState createState() => _SpotListState();
}

class _SpotListState extends State<SpotList> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchField(),
        toolbarHeight: 183.0,
      ),
      body: Stack(
        children: [
          Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "À proximité",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 220,
                                height: 340,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'lib/assets/images/image/SkatePark_Bonlieu.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'SkatePark de Bonlieu',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'À 5km de vous !',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: CustomColors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Le ball est vraiment génial ! Super agréable pour ...',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '4.3 ★',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width:10), // Espacement entre les deux éléments
                              SizedBox(
                                width: 220,
                                height: 340,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 220,
                                      height: 340,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/assets/images/image/SkatePark_Bonlieu.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'SkatePark de Bonlieu',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'À 5km de vous !',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: CustomColors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Le ball est vraiment génial ! Super agréable pour ...',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '4.3 ★',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width:10), // Espacement entre les deux éléments
                              SizedBox(
                                width: 220,
                                height: 340,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 220,
                                      height: 340,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/assets/images/image/SkatePark_Bonlieu.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'SkatePark de Bonlieu',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'À 5km de vous !',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: CustomColors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Le ball est vraiment génial ! Super agréable pour ...',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '4.3 ★',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


SizedBox(height: 20),
Row(
  children: [
    Image.asset(
      'lib/assets/images/icons/Coeur_noir.png',
      width: 24,
      height: 24,
    ),
    SizedBox(width: 5),
    Text(
      "Spots coups de coeur",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: CustomColors.black,
      ),
    ),
  ],
),
SizedBox(height: 10),
Image.asset(
  'lib/assets/images/image/skatepark_long.png',
  width: 350,
  height: 105,
),
SizedBox(height: 10),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "SkatePark de Bonlieu",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomColors.black,
          ),
        ),
        Text(
          "4.3 ★",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomColors.black,
          ),
        ),
      ],
    ),
    Text(
      "À 5km de vous !",
      style: TextStyle(
        fontSize: 16,
        color: CustomColors.grey,
      ),
    ),
    Text(
      "Le ball est vraiment génial ! Super agréable pour ...",
      style: TextStyle(
        fontSize: 14,
        color: CustomColors.black,
      ),
    ),
  ],
),

                      
SizedBox(height: 20),
Image.asset(
  'lib/assets/images/image/skatepark_long.png',
  width: 350,
  height: 105,
),
SizedBox(height: 10),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "SkatePark de Bonlieu",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomColors.black,
          ),
        ),
        Text(
          "4.3 ★",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomColors.black,
          ),
        ),
      ],
    ),
    Text(
      "À 5km de vous !",
      style: TextStyle(
        fontSize: 16,
        color: CustomColors.grey,
      ),
    ),
    Text(
      "Le ball est vraiment génial ! Super agréable pour ...",
      style: TextStyle(
        fontSize: 14,
        color: CustomColors.black,
      ),
    ),
  ],
),

















SizedBox(height: 30),
    Text(
      "Par ville",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: CustomColors.black,
      ),
    ),
    SizedBox(height:10),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 220,
                                height: 340,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'lib/assets/images/image/lyon.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Lyon',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width:10), // Espacement entre les deux éléments
                              SizedBox(
                                width: 220,
                                height: 340,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 220,
                                      height: 340,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/assets/images/image/paris.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Paris',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width:10), // Espacement entre les deux éléments
                              SizedBox(
                                width: 220,
                                height: 340,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 220,
                                      height: 340,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/assets/images/image/SkatePark_Bonlieu.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Marseille',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                              SizedBox(height: 30),

                      ],
                    ),
                  ],
                ),
              ),
            ),




          ],
          
        ),
        
      ),


Positioned(
            left: 0,
            right: 0,
            top: 520,

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 138),
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Add the first button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.3),
                            color: Colors.red,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Navigate to the first page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FirstPage()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Carte',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Image.asset(
                                      'lib/assets/images/icons/terre.png',
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Add some spacing between the buttons
                        SizedBox(width: 16),

                        // Add the second button
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.3),
                            color: Colors.red,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Navigate to the second page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Image.asset(
                                  'lib/assets/images/icons/plus.png',
                                  width: 150,
                                  height: 150,
                                  color: Colors.white,
                                ),
                              ),
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
    );
  }
}
