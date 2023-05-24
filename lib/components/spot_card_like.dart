import 'package:flutter/material.dart';

import 'package:spotted/assets/colors.dart';

class CustomImageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String rating;
  final String distance;
  final String description;

  const CustomImageCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.distance,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 350,
          height: 105,
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.black,
                  ),
                ),
                Text(
                  rating,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.black,
                  ),
                ),
              ],
            ),
            Text(
              distance,
              style: const TextStyle(
                fontSize: 16,
                color: CustomColors.grey,
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: CustomColors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
