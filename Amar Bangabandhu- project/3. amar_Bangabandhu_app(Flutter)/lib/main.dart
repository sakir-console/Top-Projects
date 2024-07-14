/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math show sin, pi, sqrt;
import 'package:amar_bangabandhu/EN/en_registration.dart';
import 'package:amar_bangabandhu/lang.dart';
import 'package:amar_bangabandhu/screens/home.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amar_bangabandhu/about.dart';
import 'package:amar_bangabandhu/corret_overlay.dart';
import 'package:amar_bangabandhu/home_page.dart';
import 'package:amar_bangabandhu/rules.dart';
import 'package:amar_bangabandhu/EN/en_home.dart';
import 'package:amar_bangabandhu/screens/registration.dart';
import 'package:amar_bangabandhu/screens/scoreboard.dart';
import 'package:amar_bangabandhu/values/img.dart';
import 'package:amar_bangabandhu/values/tone.dart';
import 'package:amar_bangabandhu/values/voice.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'puzzle_piece.dart';
import 'score_widget.dart';
import 'widgets/dateTime.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString('token');
  var lang = preferences.getString('lang');
  print("Language: $lang");
  print("tok: $token");
  // HttpOverrides.global = MyHttpOverrides();
  runApp(ScoreWidget(
    child: MaterialApp(navigatorKey: navigatorKey,
      theme: ThemeData(fontFamily: "Nunito"),
      debugShowCheckedModeBanner: false,
      home: lang ==null ? Lang():(lang=='bn'&&token == null) ? RegistrationScreen() : (lang=='en'&&token == null) ?  EnRegistrationScreen():(lang=='bn'&&token != null)? HomeScreen():(lang=='en'&&token != null) ? const EnHomeScreen():Lang(),
    ),
  ));
}


class GradientPainter extends CustomPainter {
  GradientPainter({this.gradient, this.strokeWidth, this.borderRadius});
  final Gradient gradient;
  final double strokeWidth;
  final double borderRadius;
  final Paint paintObject = Paint();
  @override
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(strokeWidth, strokeWidth,
        size.width - strokeWidth, size.height - strokeWidth);
    RRect innerRoundedRect =
    RRect.fromRectAndRadius(innerRect, Radius.circular(borderRadius));
    Rect outerRect = Offset.zero & size;
    RRect outerRoundedRect =
    RRect.fromRectAndRadius(outerRect, Radius.circular(borderRadius));
    paintObject.shader = gradient.createShader(outerRect);
    Path borderPath = _calculateBorderPath(outerRoundedRect, innerRoundedRect);
    canvas.drawPath(borderPath, paintObject);
  }

  Path _calculateBorderPath(RRect outerRRect, RRect innerRRect) {
    Path outerRectPath = Path()..addRRect(outerRRect);
    Path innerRectPath = Path()..addRRect(innerRRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class GradientBorderContainer extends StatelessWidget {
  GradientBorderContainer(
      {@required gradient,
        @required this.child,
        @required this.onPressed,
        this.strokeWidth = 4,
        this.borderRadius = 64,
        this.padding = 0,
        splashColor})
      : this.painter = GradientPainter(
      gradient: gradient,
      strokeWidth: strokeWidth,
      borderRadius: borderRadius),
        this.splashColor = splashColor ?? gradient.colors.first;
  final GradientPainter painter;
  final Widget child;
  final VoidCallback onPressed;
  final double strokeWidth;
  final double borderRadius;
  final double padding;
  final Color splashColor;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        child: Container(
            padding: EdgeInsets.only(top: 0, right: 25, left: 25),
            child: child),
      ),
    );
  }
}

/*


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}*/
