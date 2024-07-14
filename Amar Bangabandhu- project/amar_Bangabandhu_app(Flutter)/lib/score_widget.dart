/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/




import 'package:flutter/material.dart';

class ScoreWidget extends InheritedWidget {
  ScoreWidget({Key key, Widget child}) : super(key: key, child: child);

  int allInPlaceCount = 0;

  static ScoreWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ScoreWidget>();
  }

  @override
  bool updateShouldNotify(ScoreWidget oldWidget) => false;
}
