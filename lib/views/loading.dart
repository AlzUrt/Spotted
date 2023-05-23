import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';
import 'dart:async';

import 'package:spotted/views/start.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Start(),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: CustomColors.white,
          ),
          PageView(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'lib/assets/images/icons/logo.png',
                  height: 400,
                  width: 200,
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'lib/assets/images/image/start1.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
