import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;

  const CustomInputField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
