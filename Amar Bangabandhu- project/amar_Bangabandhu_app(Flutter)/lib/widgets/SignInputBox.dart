/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/


import 'package:flutter/material.dart';

class SignInputBox extends StatelessWidget {
  IconData inputIcon;
  String hintText;
  TextEditingController controller;
  SignInputBox({this.inputIcon, this.hintText,this.controller});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      width: size.width * 0.98,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            prefixIcon: Icon(
              inputIcon,
              color: Colors.teal,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(90.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(90.0)),
              borderSide: BorderSide(width: 2, color: Colors.cyan),
            ),
            hintStyle: TextStyle(
                color: Colors.red, fontFamily: "SolaimanLipi", fontSize: 19),
            filled: true,
            fillColor: Colors.white38,
            hintText: hintText),
      ),
    );
  }
}
