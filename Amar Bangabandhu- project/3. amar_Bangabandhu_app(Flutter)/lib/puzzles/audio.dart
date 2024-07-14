/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:amar_bangabandhu/values/text.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      advancedPlayer.pause();
    }
  }

  AudioPlayer advancedPlayer = AudioPlayer();

  Future<AudioPlayer> playLocalAsset() async {

    AudioCache audioCache = AudioCache(fixedPlayer: advancedPlayer);

    return await audioCache.play('audios/test.mp3',volume: 0.01);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.playLocalAsset();
  }

  // disposing listener if not needed or users navigates away from

  @override
  void dispose() {
    advancedPlayer.dispose();
    //advancedPlayer.stop();

    print("DISPOSE CONTROLLER...");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 90),
                  totalRepeatCount: 4,
                  text: [
                    TEXTS.TEXT_1948,
                    " Story of Mujib"
                  ],
                  textStyle: TextStyle(
                      fontFamily: 'Kongka',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                  pause: Duration(seconds: 10),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text('Play'),
                  onPressed: () {
                    //advancedPlayer.stop();
                    advancedPlayer.setVolume(0.1);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
