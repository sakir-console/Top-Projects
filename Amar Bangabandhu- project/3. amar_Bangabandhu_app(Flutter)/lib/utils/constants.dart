/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/



import 'package:flutter/material.dart';

class API{
  static const HOST="https://play.amarbangabandhu.app/public/";
  static const Version="api/v1/";
  static const Images=HOST+"uploads/images/";

 // http://127.0.0.1:8000/uploads/images/products/0k4D3ejmI7CBwDI.jpgproducts[i]['images'][ind]['img_name']
}







const kPrimaryColor = Color(0xFFFF8084);
const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kFixPadding = 16.0;
const kLess = 4.0;

const kShape = 30.0;

const kRadius = 0.0;
const kAppBarHeight = 56.0;

const kHeadTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: kLightColor,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20.0,
  color: kPrimaryColor,
);

const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: kDarkColor,
);

const kDivider = Divider(
  color: kAccentColor,
  thickness: kLessPadding,
);

const kSmallDivider = Divider(
  color: kAccentColor,
  thickness: 5.0,
);

const String success = 'assets/success.gif';
