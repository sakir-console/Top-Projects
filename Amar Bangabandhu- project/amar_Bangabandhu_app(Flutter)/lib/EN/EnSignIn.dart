/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/



import 'dart:math';

import 'package:amar_bangabandhu/screens/backgrounds/registration_bg.dart';
import 'package:amar_bangabandhu/utils/helpers/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amar_bangabandhu/widgets/SignInputBox.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'en_home.dart';
import 'en_registration.dart';

class EnSignInScreen extends StatefulWidget {
  @override
  _EnSignInScreenState createState() => _EnSignInScreenState();
}

class _EnSignInScreenState extends State<EnSignInScreen> {
  ProgressDialog pr;
  TextEditingController bc_nid = TextEditingController();
  TextEditingController password = TextEditingController();

  Future Login() async {
    await pr.show();
    var data = await postApi(
        "signin", {"bc_nid": bc_nid.text, "password": password.text});

    if (data['result'] == true) {
      await pr.hide();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', data['data']['token']);
      preferences.setString('grp', data['data']['grp']);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => EnHomeScreen(),
          ),
          (route) => false);
      Fluttertoast.showToast(
          msg: "${data['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      //Navigator.of(context, rootNavigator: true).pop(context);
      await pr.hide();
      Fluttertoast.showToast(
          msg: data['message'].toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color(0xFFB40284A),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      textDirection: TextDirection.ltr,
      isDismissible: true,
      /*    customBody: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
       backgroundColor: Colors.white,
     ),*/
    );

    pr.style(
//      message: 'Downloading file...',
      message: 'Please wait.. ',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInExpo,
      progress: 0.0,
      textAlign: TextAlign.center,
      progressWidgetAlignment: Alignment.center,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    return Scaffold(
      body: RegistrationBG(
        child: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/aw.png',
                      colorBlendMode: BlendMode.colorBurn,
                      fit: BoxFit.contain,
                      height: 65,
                      width: 100,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/govt.png',
                          height: 48,
                        ),
                        Text(
                          'MOLWA',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontSize: 10, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/bncc.png',
                          height: 40,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'BNCC',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontSize: 10, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/m100.png',
                      colorBlendMode: BlendMode.colorBurn,
                      height: 62,
                      width: 62,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Enter\n Information carefully",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, color: Colors.blue),
              ),
              SizedBox(height: 25),
              SignInputBox(
                controller: bc_nid,
                inputIcon: Icons.email,
                hintText: 'Birth Certificate/NID number',
              ),
              SizedBox(height: 32),
              SignInputBox(
                controller: password,
                inputIcon: FontAwesomeIcons.key,
                hintText: 'Your PIN',
              ),
              SizedBox(height: 46),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Login();
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
                        'Enter',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SolaimanLipi",
                            fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 42),
              OutlineGradientButton(
                child: Text(
                  'New Registration',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SolaimanLipi",
                      fontSize: 19),
                ),
                gradient: LinearGradient(
                    colors: [Colors.lightBlue, Colors.tealAccent]),
                strokeWidth: 2,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                radius: Radius.circular(28),
                //corners: Corners(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                backgroundColor: Colors.grey,
                elevation: 4,
                inkWell: true,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EnRegistrationScreen()));
                },
                onDoubleTap: () => null,
                onLongPress: () => null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
