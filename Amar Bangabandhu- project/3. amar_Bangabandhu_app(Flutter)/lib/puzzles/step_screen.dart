/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'package:flutter/material.dart';

class StepScreen extends StatefulWidget {
  @override
  _StepScreenState createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () {
          //Navigator.pop(context);

          // widget._onTap();
          // Navigator.pop(context);
        },
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Text('hmmmm'),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(
               "দাবায়ে রাখতে পারবা না।",

              style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'SolaimanLipi',
                  fontSize: 30.0),
            )
          ],
        ),
      ),
    );
  }
}
