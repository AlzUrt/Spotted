import 'package:flutter/material.dart';

import 'package:spotted/assets/colors.dart';
class CustomCityCard extends StatelessWidget {
  final String imagePath;
  final String cityName;

  const CustomCityCard({
    Key? key,
    required this.imagePath,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColors.black,
            ),
          ),
        ],
      ),
    );
  }
}