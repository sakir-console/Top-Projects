/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/


import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amar_bangabandhu/infoModal/modal_with_navigator.dart';
import 'package:amar_bangabandhu/values/tone.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CorrectOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;
  final int step;
  final String title;
  final String imgCaption;
  final String image;
  final String texts;
  final String voice;
  final String bcMusic;
  final int bcMusicDu;
  CorrectOverlay(this.step,this._isCorrect, this._onTap, this.title, this.imgCaption,
      this.image, this.texts, this.voice, this.bcMusic,this.bcMusicDu);

  @override
  State createState() => new CorrectOverlayState();
}

class CorrectOverlayState extends State<CorrectOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  AudioPlayer successPlay = AudioPlayer();

  Future<AudioPlayer> successTone() async {
    AudioCache audioCache = AudioCache(fixedPlayer: successPlay);

    return await audioCache.play('audios/${TONES.SUCCESS}', volume: 1.0);
  }

  Future delay() async {


    Navigator.of(context).pop();




    await Future.delayed(const Duration(milliseconds: 2300), () {

      showCupertinoModalBottomSheet(
        useRootNavigator: true,
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => ComplexModal(widget.step,widget.title, widget.imgCaption,
            widget.image, widget.texts, widget.voice, widget.bcMusic,widget.bcMusicDu),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        duration: new Duration(seconds: 1), vsync: this);
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    this.successTone();
    this.delay();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    successPlay.dispose();
    super.dispose();
  }

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
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * math.pi,
                child: new Icon(
                  widget._isCorrect == true ? Icons.done : Icons.clear,
                  size: _iconAnimation.value * 80.0,
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(
              widget._isCorrect == true
                  ? "দাবায়ে রাখতে পারবা না।"
                  : "সঠিক ভাবে চেষ্টা করুন!",
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
