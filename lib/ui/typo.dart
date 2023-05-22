import 'package:flutter/material.dart';
import 'package:spotted/assets/colors.dart';

class CustomTextStyle {
    static TextStyle title({Color color = CustomColors.black}) {
      return TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'IntegralCF',
        decoration: TextDecoration.none
      );
    }

    static TextStyle subtitle({Color color = CustomColors.grey}) {
      return TextStyle(
        color: color,
        fontSize: 10,
        fontWeight: FontWeight.bold,
        fontFamily: 'IntegralCF',
        decoration: TextDecoration.none
      );
    }
}

