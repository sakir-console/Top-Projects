/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:amar_bangabandhu/puzzles/puzzle_screen.dart';
import 'package:amar_bangabandhu/score_widget.dart';
import 'package:amar_bangabandhu/values/img.dart';
import 'package:amar_bangabandhu/values/text.dart';
import 'package:amar_bangabandhu/values/tone.dart';
import 'package:amar_bangabandhu/values/voice.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ExtraInfo extends StatefulWidget {
  final int step;
  final String title;
  final String texts;
  final String voice;
  final String bcMusic;
  final int bcMusicDu;
  const ExtraInfo(this.step, this.title, this.texts, this.voice, this.bcMusic,
      this.bcMusicDu, {Key key}) : super(key: key);
  @override
  _ExtraInfoState createState() => _ExtraInfoState();
}

class _ExtraInfoState extends State<ExtraInfo> {
  AudioPlayer advancedPlayer = AudioPlayer();

  AudioPlayer bcm = AudioPlayer();

  Future<AudioPlayer> bcPlay() async {
    AudioCache audioCache = AudioCache(fixedPlayer: bcm);

    return await audioCache.play('audios/${TONES.BCM_1}', volume: 0.03);
  }



  Future<AudioPlayer> playLocalAsset() async {
    AudioCache audioCache = AudioCache(fixedPlayer: advancedPlayer);

    return await audioCache.play('audios/${widget.voice}', volume: 1);
  }

  Future delay() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var done = preferences.getString('lev6');

    await Future.delayed(Duration(seconds: widget.bcMusicDu), () {
      //shouldClose = true;

      bcm.stop();

      setState(() {
        ScoreWidget.of(context).allInPlaceCount = 0;
      });
      // ignore: avoid_print
      print("step===========${widget.step}");

      if (done != null) {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => Puzz(
                7,
                2,
                3,
                0.727,
                'রাষ্ট্র- ১৯৪৭',
                'গান্ধীর প্রতিবাদ সভায় শেখ মুজিবুর রহমান।',
                IMAGES.IMG_1947,
                TEXTS.TEXT_1947,
                VOICES.VOICE_1947,
                TONES.BCM_1,
                18),
          ),
        );
      } else {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playLocalAsset();
    delay();
    bcPlay();
    Fluttertoast.showToast(
        msg: "বঙ্গবন্ধুর পরিবার-পরিজন ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 20.0);
  }

  @override
  void dispose() {
    advancedPlayer.dispose();
    //advancedPlayer.stop();
bcm.dispose();
    // ignore: avoid_print
    print("DISPOSE CONTROLLER...");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (context) => Builder(
            builder: (context) => CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                  // leading: Container(),
                  middle: Text(widget.title,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Kongka',
                          fontSize: 25))),
              child: SafeArea(
                bottom: false,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.red,
                    ],
                  )),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TypewriterAnimatedTextKit(
                          speed: Duration(milliseconds: 90),
                          totalRepeatCount: 1,
                          repeatForever: false,
                          text: [
                            widget.texts,
                          ],
                          textStyle: TextStyle(
                              fontFamily: 'Kongka',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          pause: Duration(seconds: 10),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
