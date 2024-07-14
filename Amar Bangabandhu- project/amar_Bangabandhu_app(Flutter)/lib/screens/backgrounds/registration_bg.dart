/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'package:flutter/material.dart';

class RegistrationBG extends StatelessWidget {
  final Widget child;
  const RegistrationBG({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: double.infinity,
        //margin: EdgeInsets.only(top: 50),
        // Here i can use size.width but use double.infinity because both work as a same
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Positioned.fill(
              //left: 12,
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  'assets/icons/bg.png',
                  colorBlendMode: BlendMode.colorBurn,
                  fit: BoxFit.fill,
                ),
              ),
            ),

/*
            Positioned(top: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: 0.2,
                  child: SvgPicture.asset(
                    "assets/icons/mujib.svg",
                    height: size.height * 0.35,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "assets/icons/girl.png",
                  width: size.width * 0.19,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "assets/icons/boy.png",
                  width: size.width * 0.25,
                ),
              ),
            ),*/
            child
          ],
        ),
      ),
    );
  }
}
