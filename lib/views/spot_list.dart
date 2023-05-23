import 'package:flutter/material.dart';
// import 'package:spotted/components/search_field.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spotted/assets/colors.dart';
import 'package:spotted/views/add_spot.dart';
import 'package:spotted/ui/typo.dart';
import 'package:spotted/views/filter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpotList(),
    );
  }
}

class SpotList extends StatefulWidget {
  const SpotList({Key? key}) : super(key: key);
  @override
  SpotListState createState() => SpotListState();
}

class SpotListState extends State<SpotList> {
  




  LatLng currentLocation =
      LatLng(45.8991, 6.1295); // Default or initial coordinates

  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double latitude = position.latitude;
    double longitude = position.longitude;

    currentLocation = LatLng(latitude, longitude); // Mettez à jour currentLocation
    // print(currentLocation);
  }

  final PageController _pageController = PageController(initialPage: 0);

  String buttonText = 'Carte';
  String buttonImage = 'lib/assets/images/icons/terre.png';
  void changePage() {
    int nextPage = _pageController.page!.round() == 0 ? 1 : 0;
    _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeIn,
    );
    // change le text de "carte" a "liste"
    setState(() {
      buttonText = buttonText == 'Carte' ? 'Liste' : 'Carte';
      buttonImage = buttonImage == 'lib/assets/images/icons/terre.png'
          ? 'lib/assets/images/icons/liste.png'
          : 'lib/assets/images/icons/terre.png';
    });
  }

  









// test
bool _isSearching = false;
  int _selectedImageIndex = 0;

  List<String> sportImages = [
    'skateboard.png',
    'bmx.png',
    'workout.png',
    'parkour.png',
    'bike.png',
  ];

  
List<String> selectedSportImages = [
  'skateboard_rouge.png',
  'bmx_rouge.png',
  'workout_rouge.png',
  'parkour_rouge.png',
  'bike_rouge.png',
];

  Widget buildMenuItem(int index, String text) {
    String imageFileName = _selectedImageIndex == index
      ? selectedSportImages[index]
      : sportImages[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedImageIndex = index;
        });
      },
      child: Column(
        children: [
          Image.asset('lib/assets/images/logo_sport/$imageFileName',
              height: 32.0, width: 32.0),
          const SizedBox(height: 5.0),
          Text(
            text,
            style: TextStyle(
              color: _selectedImageIndex == index ? Colors.red : Colors.black,
              fontSize: 13.0,
            ),
          ),
          const SizedBox(height: 9.0),
          Opacity(
            opacity: _selectedImageIndex == index ? 1.0 : 0.0,
            child: Container(
              height: 3.0,
              width: 60.0,
              color: CustomColors.red,
            ),
          ),
        ],
      ),
    );
  }










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   title: const SearchField(),
      //   toolbarHeight: 183,
      // ),
      
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 215),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "À proximité",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/assets/images/image/SkatePark_Bonlieu.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              'SkatePark de Bonlieu',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: CustomColors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'À 5km de vous !',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: CustomColors.grey,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'Le ball est vraiment génial ! Super agréable pour ...',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: CustomColors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
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
                                      const SizedBox(
                                          width:
                                              10), // Espacement entre les deux éléments
                                      SizedBox(
                                        width: 220,
                                        height: 340,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'lib/assets/images/image/SkatePark_Bonlieu.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    'SkatePark de Bonlieu',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: CustomColors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text(
                                                    'À 5km de vous !',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: CustomColors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text(
                                                    'Le ball est vraiment génial ! Super agréable pour ...',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: CustomColors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text(
                                                    '4.3 ★',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: CustomColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                          width:
                                              10), // Espacement entre les deux éléments
                                      SizedBox(
                                        width: 220,
                                        height: 340,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'lib/assets/images/image/SkatePark_Bonlieu.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    'SkatePark de Bonlieu',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: CustomColors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text(
                                                    'À 5km de vous !',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: CustomColors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text(
                                                    'Le ball est vraiment génial ! Super agréable pour ...',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: CustomColors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text(
                                                    '4.3 ★',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Image.asset(
                                      'lib/assets/images/icons/Coeur_noir.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "Spots coups de coeur",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Image.asset(
                                  'lib/assets/images/image/skatepark_long.png',
                                  width: 350,
                                  height: 105,
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
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
                                    const Text(
                                      "À 5km de vous !",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: CustomColors.grey,
                                      ),
                                    ),
                                    const Text(
                                      "Le ball est vraiment génial ! Super agréable pour ...",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Image.asset(
                                  'lib/assets/images/image/skatepark_long.png',
                                  width: 350,
                                  height: 105,
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
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
                                    const Text(
                                      "À 5km de vous !",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: CustomColors.grey,
                                      ),
                                    ),
                                    const Text(
                                      "Le ball est vraiment génial ! Super agréable pour ...",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  "Par ville",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/assets/images/image/lyon.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
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
                                      const SizedBox(
                                          width:
                                              10), // Espacement entre les deux éléments
                                      SizedBox(
                                        width: 220,
                                        height: 340,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'lib/assets/images/image/paris.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    'Paris',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: CustomColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                          width:
                                              10), // Espacement entre les deux éléments
                                      SizedBox(
                                        width: 220,
                                        height: 340,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'lib/assets/images/image/SkatePark_Bonlieu.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    'Marseille',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                const SizedBox(height: 30),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: FlutterMap(
                  options: MapOptions(
                    center: currentLocation, // Utilisez currentLocation ici
                    zoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(45.8991, 6.1295),
                          width: 25,
                          height: 35,
                          builder: (context) =>
                              Image.asset('lib/assets/images/icons/Marker.png'),
                        ),
                        Marker(
                          point: LatLng(45.9091, 6.1395),
                          width: 25,
                          height: 35,
                          builder: (context) =>
                              Image.asset('lib/assets/images/icons/Marker.png'),
                        ),
                      ],
                    ),
                  ],
                  nonRotatedChildren: const [
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          // onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 90,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 131),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.3),
                            color: CustomColors.red,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                getLocation();
                                changePage();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      buttonText,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Image.asset(
                                      buttonImage,
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
                        const SizedBox(width: 16),
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.3),
                            color: CustomColors.red,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (
                                  // get current location

                                  ) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddSpot()),
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
           Positioned(
      left: 0,
      right: 0,
      top: 0,
      
      child: Container(
        decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 55.0),
            Container(
              height: 65.0,
              margin: const EdgeInsets.symmetric(horizontal: 29.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isSearching = true;
                  });
                },
                child: Row(
                  children: [
                    const SizedBox(width: 10.0),
                    const Icon(Icons.search, color: CustomColors.black),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: _isSearching
                          ? TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '',
                                hintStyle: CustomTextStyle.title(),
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Spot',
                                  style: CustomTextStyle.title(),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  'Une adresse ∙ une ville ∙ un sport ∙ ...',
                                  style: CustomTextStyle.subtitle(),
                                ),
                              ],
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Filter(),
                          ),
                        );
                      }, // Accéder à onPressedFilter via widget
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          'lib/assets/images/icons/filter_icon.png',
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 29.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildMenuItem(0, 'Skateboard'),
                        buildMenuItem(1, 'BMX'),
                        buildMenuItem(2, 'Street Workout'),
                        buildMenuItem(3, 'Parkour'),
                        buildMenuItem(4, 'VTT'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    Positioned(
      top: -15,
      left: 0,
      right: 0,
      child: Container(
        height: 5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors.red.withOpacity(0.12),
              Colors.transparent,
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
