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
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'lib/assets/images/gif/swag.gif',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
