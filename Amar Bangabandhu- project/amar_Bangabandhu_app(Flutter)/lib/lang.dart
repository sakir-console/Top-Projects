/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/


import 'dart:math';

import 'package:amar_bangabandhu/screens/backgrounds/registration_bg.dart';
import 'package:amar_bangabandhu/screens/home.dart';
import 'package:amar_bangabandhu/utils/helpers/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amar_bangabandhu/main.dart';
import 'package:amar_bangabandhu/screens/registration.dart';
import 'package:amar_bangabandhu/widgets/SignInputBox.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EN/en_registration.dart';

class Lang extends StatefulWidget {
  @override
  _LangState createState() => _LangState();
}

class _LangState extends State<Lang> {
  ProgressDialog pr;
  TextEditingController bc_nid = TextEditingController();
  TextEditingController password = TextEditingController();

  // ignore: non_constant_identifier_names
  Future SelectLanguage(String ln) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lang', ln);
    print("Language: $ln");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ln == 'bn' ? RegistrationScreen() : EnRegistrationScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegistrationBG(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "ভাষা/Language",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "SolaimanLipi",
                    fontSize: 28,
                    color: Colors.deepOrange),
              ),
              SizedBox(height: 86),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {

                    SelectLanguage('bn');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.indigo, Colors.pink],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        'বাংলা',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SolaimanLipi",
                            fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 46),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    SelectLanguage('en');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        'English',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SolaimanLipi",
                            fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
