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
  List<String> images = [
    'https://picsum.photos/id/237/200/300',
    'https://picsum.photos/id/238/200/300',
    'https://picsum.photos/id/239/200/300',
    'https://picsum.photos/id/240/200/300',
    'https://picsum.photos/id/241/200/300',
    'https://picsum.photos/id/242/200/300',
    'https://picsum.photos/id/243/200/300',
    'https://picsum.photos/id/244/200/300',
    'https://picsum.photos/id/245/200/300',
    'https://picsum.photos/id/246/200/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchField(),
        toolbarHeight: 183.0,
      ),
      body: Container(
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


SizedBox(height: 10),
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

                      
SizedBox(height: 30),
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



                        
                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: images.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(images[index]);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
