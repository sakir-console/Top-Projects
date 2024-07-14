/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'dart:convert';

import 'package:amar_bangabandhu/utils/constants.dart';
import 'package:amar_bangabandhu/utils/helpers/api.dart';
import 'package:amar_bangabandhu/widgets/defaultButton.dart';
import 'package:flutter/material.dart';

import 'package:amar_bangabandhu/widgets/emptySection.dart';
import 'package:amar_bangabandhu/widgets/subTitle.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Success extends StatefulWidget {
  String emtymsg;
  String sbtilemsg;
  Success(this.emtymsg, this.sbtilemsg);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: success,
            emptyMsg: widget.emtymsg,
          ),
          SubTitle(
            subTitleText: widget.sbtilemsg,
          ),
          DefaultButton(
            btnText: 'Ok',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ],
      ),
    );
  }
}
