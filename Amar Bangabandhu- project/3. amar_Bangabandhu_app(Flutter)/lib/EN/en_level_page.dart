/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amar_bangabandhu/score_widget.dart';
import 'package:amar_bangabandhu/main.dart';

import 'package:amar_bangabandhu/puzzles/audio.dart';

import 'package:amar_bangabandhu/values/img.dart';
import 'package:amar_bangabandhu/EN/values/text.dart';
import 'package:amar_bangabandhu/EN/values/tone.dart';
import 'package:amar_bangabandhu/EN/values/voice.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'en_puzzle_screen.dart';

class EnLevelPage extends StatefulWidget {
  @override
  _EnLevelPageState createState() => _EnLevelPageState();
}

class _EnLevelPageState extends State<EnLevelPage> {
  final double _borderRadius = 24;

  var items = [
    LevelInfo(
        'Birth story – 1920',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '1',
        Puzz(
            1,
            2,
            2,
            1.56,
            'Birth story - 1920',
            'Bangabandhus ancestral home',
            IMAGES.IMG_1920,
            TEXTS.TEXT_1920,
            VOICES.VOICE_1920,
            TONES.BCM_1,
            16)),
    LevelInfo(
        'First School Life - 1927',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '2',
        Puzz(
            2,
            2,
            2,
            0.8777,
            'First School Life - 1927',
            'Gimadanga High SChool',
            IMAGES.IMG_1927,
            TEXTS.TEXT_1927,
            VOICES.VOICE_1927,
            TONES.BCM_1,
            18)),
    LevelInfo(
        'Wedding – 1932',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '3',
        Puzz(
            3,
            2,
            2,
            0.837,
            'Wedding - 1932',
            'Bangamata Fazilatunnesa and Sheikh Mujib.',
            IMAGES.IMG_1932,
            TEXTS.TEXT_1932,
            VOICES.VOICE_1932,
            TONES.BCM_1,
            14)),
    LevelInfo(
        'Matriculation - 1942',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '4',
        Puzz(
            4,
            2,
            2,
            1.282,
            'Matriculation - 1942',
            'Calcutta Islamia College.',
            IMAGES.IMG_1942,
            TEXTS.TEXT_1942,
            VOICES.VOICE_1942,
            TONES.BCM_1,
            20)),
    LevelInfo(
        'All India Muslim League - 1943',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '5',
        Puzz(
            5,
            2,
            2,
            1.555,
            'All India Muslim League - 1943',
            'Young Sheikh Mujibur Rahman.',
            IMAGES.IMG_1943,
            TEXTS.TEXT_1943,
            VOICES.VOICE_1943,
            TONES.BCM_1,
            17)),
    LevelInfo(
        'Communal Riot - 1946',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '6',
        Puzz(
            6,
            3,
            2,
            0.977,
            'Communal Riot - 1946',
            'Shawkat Ali and young Bangabandhu.',
            IMAGES.IMG_1946,
            TEXTS.TEXT_1946,
            VOICES.VOICE_1946,
            TONES.BCM_1,
            20)),

    LevelInfo(
        'Dream of Independent Bangla - 1947',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '7',
        Puzz(
            7,
            2,
            3,
            0.727,
            'Dream of Independent Bangla - 1947',
            'Bangabandhu Sheikh Mujibur Rahman in Gandhis protest meeting',
            IMAGES.IMG_1947,
            TEXTS.TEXT_1947,
            VOICES.VOICE_1947,
            TONES.BCM_1,
            21)),
    LevelInfo(
        'State Language - 1948',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '8',
        Puzz(
            8,
            2,
            3,
            1.02,
            'State Language - 1948',
            'Speech by Muhammad Ali Jinnah',
            IMAGES.IMG_1948,
            TEXTS.TEXT_1948,
            VOICES.VOICE_1948,
            TONES.BCM_1,
            85)),
    LevelInfo(
        'Humanity - 1949',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '9',
        Puzz(
            9,
            2,
            3,
            0.915,
            'Humanity - 1949',
            'Bangabandhu was released from prison.',
            IMAGES.IMG_1949,
            TEXTS.TEXT_1949,
            VOICES.VOICE_1949,
            TONES.BCM_1,
            18)),
    LevelInfo(
        'Language Movement - 1952',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '10',
        Puzz(
            10,
            3,
            2,
            2.044,
            'Language Movement - 1952',
            'Bangabandhu with Awami League leaders and workers.',
            IMAGES.IMG_1952,
            TEXTS.TEXT_1952,
            VOICES.VOICE_1952,
            TONES.BCM_1,
            16)),
    LevelInfo(
        'Awami Muslim League - 1953',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '11',
        Puzz(
            11,
            3,
            2,
            2.0582,
            'Awami Muslim League - 1953',
            'Sheikh Mujibur Rahman is speaking.',
            IMAGES.IMG_1953,
            TEXTS.TEXT_1953,
            VOICES.VOICE_1953,
            TONES.BCM_1,
            12)),
    LevelInfo(
        'East Pakistan Election - 1954',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '12',
        Puzz(
            12,
            3,
            2,
            2.379,
            'East Pakistan Election - 1954',
            'United Front Cabinet',
            IMAGES.IMG_1954,
            TEXTS.TEXT_1954,
            VOICES.VOICE_1954,
            TONES.BCM_1,
            27)),
    LevelInfo(
        'Naming of Awami League - 1955',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '13',
        Puzz(
            13+1,
            3,
            3,
            1.379,
            'Naming of Awami League - 1955',
            'Suhrawardy and Sheikh Mujib',
            IMAGES.IMG_1955,
            TEXTS.TEXT_1955,
            VOICES.VOICE_1955,
            TONES.BCM_1,
            29)),
    LevelInfo(
        'Country and Party First - 1956',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '14',
        Puzz(
            14+1,
            3,
            3,
            0.924,
            'Country and Party First - 1956',
            'Sheikh Mujib with Suhrawardy.',
            IMAGES.IMG_1956,
            TEXTS.TEXT_1956,
            VOICES.VOICE_1956,
            TONES.BCM_1,
            25)),
    LevelInfo(
        'Awami Council - 1957',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '15',
        Puzz(
            15+1,
            3,
            3,
            1.372,
            'Awami Council - 1957',
            'Kagmari Conference.',
            IMAGES.IMG_1957,
            TEXTS.TEXT_1957,
            VOICES.VOICE_1957,
            TONES.BCM_1,
            16)),
    LevelInfo(
        'Martial Law - 1958',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '16',
        Puzz(
            16+1,
            3,
            3,
            1.29,
            'Martial Law - 1958',
            'Minister Sheikh Mujibur Rahman in New Delhi.',
            IMAGES.IMG_1958,
            TEXTS.TEXT_1958,
            VOICES.VOICE_1958,
            TONES.BCM_1,
            33)),
    LevelInfo(
        'Swadhin Bangla Biplobi Parishad - 1961',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '17',
        Puzz(
            17+1,
            3,
            3,
            0.822,
            'Swadhin Bangla Biplobi Parishad - 1961',
            'Sheikh Mujib in the field of politics.',
            IMAGES.IMG_1961,
            TEXTS.TEXT_1961,
            VOICES.VOICE_1961,
            TONES.BCM_1,
            21)),
    LevelInfo(
        'National Democratic Front - 1962',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '18',
        Puzz(
            18+1,
            3,
            3,
            1.399,
            'National Democratic Front - 1962',
            'Sheikh Mujibur Rahman is addressing the protest meeting.',
            IMAGES.IMG_1962,
            TEXTS.TEXT_1962,
            VOICES.VOICE_1962,
            TONES.BCM_1,
            32)),
    LevelInfo(
        'Rejuvenate of Awami League - 1964',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '19',
        Puzz(
            19+1+1,
            3,
            3,
            1.377,
            'Rejuvenate of Awami League - 1964',
            'Bhasani and Sheikh Mujib on the morning ferry of Ekushey.',
            IMAGES.IMG_1964,
            TEXTS.TEXT_1964,
            VOICES.VOICE_1964,
            TONES.BCM_1,
            27)),
    LevelInfo(
      'The so-called 1965',
      Color(0xffD76EF5),
      Color(0xff8F7AFE),
      '20',
      Puzz(
          20+1+1,
          3,
          4,
          1.02,
          'The so-called 1965',
          'Sheikh Mujibur Rahman lecturing at Armanitola.',
          IMAGES.IMG_1965,
          TEXTS.TEXT_1965,
          VOICES.VOICE_1965,
          TONES.BCM_1,
          21),
    ),
    LevelInfo(
        'Six-point demand – 1966',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '21',
        Puzz(
            21+1+1,
            3,
            4,
            1.307,
            'Six-point demand - 1966',
            'Sheikh Mujibur Rahman announcing the six-point program.',
            IMAGES.IMG_1966,
            TEXTS.TEXT_1966,
            VOICES.VOICE_1966,
            TONES.BCM_1,
            23)),
    LevelInfo(
        'Agartala Case-1968',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '22',
        Puzz(
            22+1+1,
            3,
            4,
            0.937,
            'Agartala Case-1968',
            'Sheikh Mujib and Tajuddin Ahmed.',
            IMAGES.IMG_1968,
            TEXTS.TEXT_1968,
            VOICES.VOICE_1968,
            TONES.BCM_1,
            22)),
    LevelInfo(
        'Titled as Bangabandhu – 1969',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '23',
        Puzz(
            23+1+1,
            4,
            3,
            1.152,
            'Titled as Bangabandhu - 1969',
            'Bangabandhu on his way to the tribunal in the Agartala case.',
            IMAGES.IMG_1969,
            TEXTS.TEXT_1969,
            VOICES.VOICE_1969,
            TONES.BCM_1,
            56)),
    LevelInfo(
        'National Assembly- 1970',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '24',
        Puzz(
            24+1+1,
            4,
            3,
            1.867,
            'National Assembly- 1970',
            'Sheikh Mujib at an election rally in Tejgaon.',
            IMAGES.IMG_1970,
            TEXTS.TEXT_1970,
            VOICES.VOICE_1970,
            TONES.BCM_1,
            18)),
    LevelInfo(
        'Stormy March -1971',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '25',
        Puzz(
            25+1+1+1,
            4,
            3,
            1.87,
            'Stormy March -1971',
            'Bangabandhu on the way to the racecourse ground.',
            IMAGES.IMG_1971,
            TEXTS.TEXT_1971,
            VOICES.VOICE_1971,
            TONES.BCM_1,
            34)),
    LevelInfo(
        'Return of Bangabandhu - 1972',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '26',
        Puzz(
            26+1+1+1,
            4,
            4,
            1.366,
            'Return of Bangabandhu - 1972',
            'Bangabandhu at the first press conference in London.',
            IMAGES.IMG_1972,
            TEXTS.TEXT_1972,
            VOICES.VOICE_1972,
            TONES.BCM_1,
            57)),
    LevelInfo(
        'Reformation of Bangladesh - 1973',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '27',
        Puzz(
            27+1+1+1,
            4,
            4,
            1.777,
            'Reformation of Bangladesh - 1973',
            'Bangabandhu with Fidel Castro.',
            IMAGES.IMG_1973,
            TEXTS.TEXT_1973,
            VOICES.VOICE_1973,
            TONES.BCM_1,
            28)),
    LevelInfo(
        'Foreign Policy - 1974',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '28',
        Puzz(
            28+1+1+1,
            4,
            4,
            1.487,
            'Foreign Policy - 1974',
            'Bangabandhu visits cyclone-ravaged coast',
            IMAGES.IMG_1974,
            TEXTS.TEXT_1974,
            VOICES.VOICE_1974,
            TONES.BCM_1,
            29)),
    LevelInfo(
        'Martyrdom - 1975',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '29',
        Puzz(
            29+1+1+1,
            4,
            4,
            1.777,
            'Martyrdom - 1975',
            'Bangabandhu Sheikh Mujibur Rahman and Sheikh Russell.',
            IMAGES.IMG_1975,
            TEXTS.TEXT_1975,
            VOICES.VOICE_1975,
            TONES.BCM_1,
            59)),
  ];

  List hfData = List();

  Future stepLocker() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lev1', 'done');
/*

    preferences.setString('lev2', 'done');
    preferences.setString('lev3', 'done');
    preferences.setString('lev4', 'done');
    preferences.setString('lev5', 'done');
    preferences.setString('lev6', 'done');
    preferences.setString('lev8', 'done');
    preferences.setString('lev9', 'done');
    preferences.setString('lev10', 'done');
    preferences.setString('lev11', 'done');
    preferences.setString('lev12', 'done');
    preferences.setString('lev13', 'done');
    preferences.setString('lev14', 'done');
    preferences.setString('lev15', 'done');
    preferences.setString('lev16', 'done');
    preferences.setString('lev17', 'done');
    preferences.setString('lev18', 'done');
    preferences.setString('lev19', 'done');
    preferences.setString('lev20', 'done');
    preferences.setString('lev21', 'done');
    preferences.setString('lev22', 'done');
    preferences.setString('lev23', 'done');
    preferences.setString('lev24', 'done');
    preferences.setString('lev25', 'done');
    preferences.setString('lev26', 'done');
    preferences.setString('lev27', 'done');
    preferences.setString('lev28', 'done');
    preferences.setString('lev29', 'done');
    preferences.setString('lev30', 'done');

*/





    var total = preferences.getKeys().toList();
    print("hoooooooooooooooooo=${preferences.getString('LT1')}");
    setState(() {
      for (int i = 0; i < total.length; i++) {
        hfData.add(total[i]);
      }
    });
    print(hfData);

    hfData.contains('lev7') != true
        ? print('nulll cont')
        : print('lav7 aseeee');



  }

  @override
  void initState() {
    this.stepLocker();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green, Colors.blue])),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.home_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () async {
              SharedPreferences preferences =
              await SharedPreferences.getInstance();
              var clear = preferences.clear();
              Fluttertoast.showToast(
                  msg: "Reset successful",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Color(0xFFB40284A),
                  textColor: Colors.white,
                  fontSize: 16.0);
              preferences.setString('lev1', 'done');

            },
            child: Text(
              "Reset\nGame",
              style: TextStyle(fontSize: 12),
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
        // centerTitle: true,
        title: Text(
          'Select game level',
          style: TextStyle(fontFamily: 'Kongka', fontSize: 22),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              SharedPreferences preferences =
              await SharedPreferences.getInstance();
              var done = preferences.getString('lev' + '${index + 1}');
              print('====================${done}');

              print(preferences.getKeys());
              print(('lev' + '${index + 1}'));

              if (done != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => items[index].location))
                    .then((context) async {
                  bool shouldClose = false;
                  await showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text('Pick new level',
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Kongka',
                                fontSize: 25)),
                        actions: <Widget>[
                          CupertinoButton(
                            child: Text('Yes',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontFamily: 'Kongka',
                                    fontSize: 25)),
                            onPressed: () {
                              shouldClose = true;
                              Navigator.of(context).pop();

                              setState(() {
                                ScoreWidget.of(context).allInPlaceCount = 0;
                              });
                            },
                          ),
                          CupertinoButton(
                            child: const Text('No',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontFamily: 'Kongka',
                                    fontSize: 25)),
                            onPressed: () {
                              shouldClose = false;
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ));
                  return shouldClose;
                });
              } else {
                showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text('Play previous level first',
                          style: TextStyle(
                              color: Colors.teal,
                              fontFamily: 'Kongka',
                              fontSize: 25)),
                      actions: <Widget>[
                        CupertinoButton(
                          child: Text('Okay',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: 'Kongka',
                                  fontSize: 25)),
                          onPressed: () {
                            //shouldClose = true;
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ));
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        gradient: LinearGradient(
                            colors: [
                              items[index].startColor,
                              items[index].endColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: items[index].endColor,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: CustomPaint(
                        size: Size(100, 150),
                        painter: CustomCardShapePainter(_borderRadius,
                            items[index].startColor, items[index].endColor),
                      ),
                    ),
                    Positioned.fill(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              'assets/images/Bangabandhu_art.png',
                              height: 64,
                              width: 64,
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  items[index].name,
                                  style:GoogleFonts.meriendaOne(color: Colors.white,fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    items[index].level,
                                    style: TextStyle(
                                      color: Colors.white,
                                      //fontFamily: 'SolaimanLipi',
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Level',
                                  style: TextStyle(
                                      fontFamily: 'SolaimanLipi', fontSize: 22),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      //height: 10,
                      // bottom: 75,
                      //left: MediaQuery.of(context).size.width/1.18,
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue[400],
                          radius: 30,
                          child: Icon(
                            hfData.contains('lev' + '${index + 1}') ==
                                true
                                ? FontAwesomeIcons.unlock
                                : Icons.lock,
                            color:
                            hfData.contains('lev' + '${index + 1}') ==
                                true
                                ? Colors.white
                                : Colors.black54,
                            size: 18,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LevelInfo {
  final String name;

  final Widget location;
  final String level;
  final Color startColor;
  final Color endColor;

  LevelInfo(
      this.name, this.startColor, this.endColor, this.level, this.location);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
