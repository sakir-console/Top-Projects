/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'package:flutter/material.dart';

Color mainColor = Color.fromRGBO(255, 204, 0, 1);
var roundedRectangle = RoundedRectangleBorder(
  borderRadius: BorderRadiusDirectional.circular(12),
  side: BorderSide(width: 0.1, color: mainColor),
);

var roundedRectangle32 = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
);


class AppColors {
  static const Color black = Color(0xFF303943);
  static const Color blue = Color(0xFF429BED);
  static const Color brown = Color(0xFFB1736C);
  static const Color grey = Color(0x64303943);
  static const Color indigo = Color(0xFF6C79DB);
  static const Color lightBlue = Color(0xFF58ABF6);
  static const Color lightBrown = Color(0xFFCA8179);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color lighterGrey = Color(0xFFF4F5F4);
  static const Color lightPurple = Color(0xFF9F5BBA);
  static const Color lightRed = Color(0xFFF7786B);
  static const Color lightTeal = Color(0xFF2CDAB1);
  static const Color lightYellow = Color(0xFFFFCE4B);
  static const Color purple = Color(0xFF7C538C);
  static const Color red = Color(0xFFFA6555);
  static const Color teal = Color(0xFF4FC1A6);
  static const Color yellow = Color(0xFFF6C747);
}
