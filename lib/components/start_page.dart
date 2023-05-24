import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';

class CustomHorizontalCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String distance;
  final String description;
  final String rating;

  const CustomHorizontalCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.distance,
    required this.description,
    required this.rating,
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
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            distance,
            style: const TextStyle(
              fontSize: 16,
              color: CustomColors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: CustomColors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            rating,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
