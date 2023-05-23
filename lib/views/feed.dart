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
        children: const [
          SingleChildScrollView(
            
          ),
        ],
      ),
    );
  }
}
