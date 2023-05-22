import 'package:flutter/material.dart';
import 'package:spotted/components/search_field.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spotted/assets/colors.dart';

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
  List<String> sportImages = [
    'skateboard_gris.png',
    'bmx.png',
    'street_workout.png',
    'parkour.png',
    'vtt.png',
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
            style:const TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  double topPosition = 520;
  double seeMenu = 183;
  double sliderValue = 1;

  LatLng currentLocation =
      LatLng(45.8991, 6.1295); // Default or initial coordinates

  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double latitude = position.latitude;
    double longitude = position.longitude;

    // currentLocation = LatLng(latitude, longitude); // Mettez à jour currentLocation
    LatLng currentLocation = LatLng(45.8991, 6.1295);
    // print(currentLocation);
  }

  final PageController _pageController = PageController(initialPage: 0);

  String buttonText = 'Carte';
  String buttonImage = 'lib/assets/images/icons/terre.png';
  void changePage() {
    setState(() {
      topPosition = 520;
      seeMenu = 183;
    });
    int nextPage = _pageController.page!.round() == 0 ? 1 : 0;
    _pageController.animateToPage(
      nextPage,
      duration:const Duration(milliseconds: 1),
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

  changePage2() {
    setState(() {
      topPosition = 1600;
      seeMenu = 0;
    });
    int nextPage =
        _pageController.page!.round() == 0 || _pageController.page!.round() == 1
            ? 2
            : _pageController.page!.round();
    _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeIn,
    );
  }

  changePage3() {
    setState(() {
      topPosition = 1600;
      seeMenu = 0;
    });
    int nextPage =
        _pageController.page!.round() == 0 || _pageController.page!.round() == 1
            ? 3
            : _pageController.page!.round();
    _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: SearchField(
          onPressedFilter: changePage3,
        ),
        toolbarHeight: seeMenu,
      ),
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
                          const EdgeInsets.only(left: 32, right: 32, top: 32),
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
                                     const  SizedBox(
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
                                      children:const  [
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
                                              decoration:const  BoxDecoration(
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
                                                    decoration:const  BoxDecoration(
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
                                                    decoration:const  BoxDecoration(
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
                  nonRotatedChildren: const[
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
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          changePage();
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
                      Center(
                        child: Container(
                          width: 314,
                          height: 55,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Nom du spot',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 30),
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
                      const SizedBox(height: 30), // Marge supérieure
                      // Marge supérieure
                      Center(
                        child: Container(
                          width: 314,
                          height: 55,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Localisation du spot',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 30),
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
                      Center(
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: CustomColors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              'Proposer le spot',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          changePage();
                        },
                        child: Image.asset(
                          'lib/assets/images/icons/croix.png',
                          height: 60,
                          width: 60,
                        ),
                      ),
                      // SizedBox(height: 15), // Marge supérieure
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
                      Center(
                        child: Container(
                          height: 0.5,
                          width: 312,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 30), // Marge supérieure
                      Center(
                        child: Container(
                          width: 314,
                          height: 55,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Localisation du spot',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Image.asset(
                                  'lib/assets/images/icons/loca.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30), // Espacement de 50 pixels
                      const Padding(
                        padding: EdgeInsets.only(left: 50.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Distance',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: 335,
                          child: Column(
                            children: [
                              SliderTheme(
                                data: const SliderThemeData(
                                  trackHeight: 1.0,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 8.0),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 16.0),
                                ),
                                child: Slider(
                                  min: 0,
                                  max: 4,
                                  divisions: 4,
                                  value: sliderValue,
                                  onChanged: (value) {
                                    setState(() {
                                      sliderValue = value;
                                    });
                                  },
                                  activeColor: Colors.red,
                                ),
                              ),
                              // SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:const  [
                                  Text(
                                    '1km',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '5km',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '10km',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '20km',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '50km',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30), // Marge supérieure
                      Center(
                        child: Container(
                          height: 0.5,
                          width: 312,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 30),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: [
                            const Text(
                              'Note',
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
                                  'lib/assets/images/icons/etoiles.png',
                                  height: 24,
                                  width: 24,
                                ),
                                Image.asset(
                                  'lib/assets/images/icons/etoiles.png',
                                  height: 24,
                                  width: 24,
                                ),
                                Image.asset(
                                  'lib/assets/images/icons/etoiles.png',
                                  height: 24,
                                  width: 24,
                                ),
                                Image.asset(
                                  'lib/assets/images/icons/etoiles.png',
                                  height: 24,
                                  width: 24,
                                ),
                                Image.asset(
                                  'lib/assets/images/icons/etoiles.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                     const SizedBox(height: 30), // Marge supérieure
                      Center(
                        child: Container(
                          height: 0.5,
                          width: 312,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: [
                            const Text(
                              'Spots gratuits uniquement',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Image.asset(
                              'lib/assets/images/icons/carre.png',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                     const  SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: [
                            const Text(
                              'Eau à disposition',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Image.asset(
                              'lib/assets/images/icons/carre.png',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                     const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: [
                            const Text(
                              'Prises électriques à disposition',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Image.asset(
                              'lib/assets/images/icons/carre.png',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: CustomColors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              'Rechercher',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: topPosition,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 138),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.3),
                            color: Colors.red,
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
                            color: Colors.red,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (
                                  // get current location

                                  ) {
                                changePage2();
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