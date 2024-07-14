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

import 'package:amar_bangabandhu/puzzles/puzzle_screen.dart';
import 'package:amar_bangabandhu/values/img.dart';
import 'package:amar_bangabandhu/values/text.dart';
import 'package:amar_bangabandhu/values/tone.dart';
import 'package:amar_bangabandhu/values/voice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'infoModal/extra_info_modal.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _borderRadius = 24;

  var items = [
    LevelInfo(
        'জন্মকথা -১৯২০',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '১',
        Puzz(
            1,
            2,
            2,
            1.56,
            'জন্মকথা -১৯২০',
            'বঙ্গবন্ধুর পৈতৃক নিবাস। ',
            IMAGES.IMG_1920,
            TEXTS.TEXT_1920,
            VOICES.VOICE_1920,
            TONES.BCM_1,
            13)),
    LevelInfo(
        'সবার আমি ছাত্র- ১৯২৭',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '২',
        Puzz(
            2,
            2,
            2,
            0.8777,
            'সবার আমি ছাত্র- ১৯২৭',
            'গিমাডাঙ্গা টুঙ্গিপাড়া  সরকারি উচ্চ বিদ্যালয়',
            IMAGES.IMG_1927,
            TEXTS.TEXT_1927,
            VOICES.VOICE_1927,
            TONES.BCM_1,
            16)),
    LevelInfo(
        'বন্ধন - ১৯৩২',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '৩',
        Puzz(
            3,
            2,
            2,
            0.837,
            'বন্ধন - ১৯৩২',
            'বঙ্গমাতা ফজিলাতুন্নেছা  ও শেখ মুজিব।',
            IMAGES.IMG_1932,
            TEXTS.TEXT_1932,
            VOICES.VOICE_1932,
            TONES.BCM_1,
            14)),
    LevelInfo(
        'ম্যাট্রিকুলেশন - ১৯৪২',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '৪',
        Puzz(
            4,
            2,
            2,
            1.282,
            'ম্যাট্রিকুলেশন - ১৯৪২',
            'কলকাতা ইসলামিয়া কলেজ।',
            IMAGES.IMG_1942,
            TEXTS.TEXT_1942,
            VOICES.VOICE_1942,
            TONES.BCM_1,
            16)),
    LevelInfo(
        'প্রতিনিধি - ১৯৪৩',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '৫',
        Puzz(
            5,
            2,
            2,
            1.555,
            'প্রতিনিধি - ১৯৪৩',
            'যুবক শেখ মুজিবুর রহমান।',
            IMAGES.IMG_1943,
            TEXTS.TEXT_1943,
            VOICES.VOICE_1943,
            TONES.BCM_1,
            14)),
    LevelInfo(
        ' ছাত্র সংসদ - ১৯৪৬',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        '৬',
        Puzz(
            6,
            3,
            2,
            0.977,
            ' ছাত্র সংসদ - ১৯৪৬',
            'সহযোদ্ধা শওকত আলী এবং তরুণ বঙ্গবন্ধু। ',
            IMAGES.IMG_1946,
            TEXTS.TEXT_1946,
            VOICES.VOICE_1946,
            TONES.BCM_1,
            19)),

    LevelInfo(
        'রাষ্ট্র- ১৯৪৭',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '৭',
        Puzz(
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
            18)),
    LevelInfo(
        'ঢাকা বিশ্ববিদ্যালয় - ১৯৪৮',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '৮',
        Puzz(
            8,
            2,
            3,
            1.02,
            'ঢাকা বিশ্ববিদ্যালয় - ১৯৪৮',
            'মুহাম্মদ আলী জিন্নাহ-র ভাষণ',
            IMAGES.IMG_1948,
            TEXTS.TEXT_1948,
            VOICES.VOICE_1948,
            TONES.BCM_1,
            55)),
    LevelInfo(
        'ভাই - ১৯৪৯',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '৯',
        Puzz(
            9,
            2,
            3,
            0.915,
            'ভাই - ১৯৪৯',
            'কারাগার থেকে মুক্তি লাভের পর বঙ্গবন্ধু।',
            IMAGES.IMG_1949,
            TEXTS.TEXT_1949,
            VOICES.VOICE_1949,
            TONES.BCM_1,
            26)),
    LevelInfo(
        'মাতৃভাষা - ১৯৫২',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '১০',
        Puzz(
            10,
            3,
            2,
            2.044,
            'মাতৃভাষা - ১৯৫২',
            'আওয়ামী লীগ নেতা-কর্মীদের সাথে বঙ্গবন্ধু।',
            IMAGES.IMG_1952,
            TEXTS.TEXT_1952,
            VOICES.VOICE_1952,
            TONES.BCM_1,
            20)),
    LevelInfo(
        'আওয়ামী মুসলিম লীগ - ১৯৫৩',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '১১',
        Puzz(
            11,
            3,
            2,
            2.0582,
            'আওয়ামী মুসলিম লীগ - ১৯৫৩',
            'শেখ মুজিবুর রহমান বক্তব্য রাখছেন।',
            IMAGES.IMG_1953,
            TEXTS.TEXT_1953,
            VOICES.VOICE_1953,
            TONES.BCM_1,
            9)),
    LevelInfo(
        'যুক্তফ্রন্ট - ১৯৫৪',
        Color(0xffFFB157),
        Color(0xffFFA057),
        '১২',
        Puzz(
            12,
            3,
            2,
            2.379,
            'যুক্তফ্রন্ট - ১৯৫৪',
            'যুক্তফ্রন্ট মন্ত্রিসভা',
            IMAGES.IMG_1954,
            TEXTS.TEXT_1954,
            VOICES.VOICE_1954,
            TONES.BCM_1,
            23)),
    LevelInfo(
        'আওয়ামী লীগ - ১৯৫৫',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '১৩',
        Puzz(
            13+1,
            3,
            3,
            1.379,
            'আওয়ামী লীগ - ১৯৫৫',
            'সোহরাওয়ার্দী ও বঙ্গবন্ধু',
            IMAGES.IMG_1955,
            TEXTS.TEXT_1955,
            VOICES.VOICE_1955,
            TONES.BCM_1,
            26)),
    LevelInfo(
        'পদত্যাগ - ১৯৫৬',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '১৪',
        Puzz(
            14+1,
            3,
            3,
            0.924,
            'পদত্যাগ - ১৯৫৬',
            'সোহ্‌রাওয়ার্দী এবং মুজিব',
            IMAGES.IMG_1956,
            TEXTS.TEXT_1956,
            VOICES.VOICE_1956,
            TONES.BCM_1,
            24)),
    LevelInfo(
        'কাউন্সিল- ১৯৫৭',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '১৫',
        Puzz(
            15+1,
            3,
            3,
            1.372,
            'কাউন্সিল- ১৯৫৭',
            'কাগমারী সম্মেলন।',
            IMAGES.IMG_1957,
            TEXTS.TEXT_1957,
            VOICES.VOICE_1957,
            TONES.BCM_1,
            15)),
    LevelInfo(
        'গ্রেফতার - ১৯৫৮',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '১৬',
        Puzz(
            16+1,
            3,
            3,
            1.29,
            'গ্রেফতার - ১৯৫৮',
            'নয়াদিল্লিতে মন্ত্রী শেখ মুজিবুর রহমান। ',
            IMAGES.IMG_1958,
            TEXTS.TEXT_1958,
            VOICES.VOICE_1958,
            TONES.BCM_1,
            25)),
    LevelInfo(
        'স্বাধীন বাংলা বিপ্লবী পরিষদ - ১৯৬১',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '১৭',
        Puzz(
            17+1,
            3,
            3,
            0.822,
            'স্বাধীন বাংলা বিপ্লবী পরিষদ - ১৯৬১',
            'রাজনীতির মাঠে শেখ মুজিব।',
            IMAGES.IMG_1961,
            TEXTS.TEXT_1961,
            VOICES.VOICE_1961,
            TONES.BCM_1,
            19)),
    LevelInfo(
        'অবসান - ১৯৬২',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        '১৮',
        Puzz(
            18+1,
            3,
            3,
            1.399,
            'অবসান - ১৯৬২',
            'প্রতিবাদ বৈঠকে ভাষণ দিচ্ছেন শেখ মুজিবুর রহমান।',
            IMAGES.IMG_1962,
            TEXTS.TEXT_1962,
            VOICES.VOICE_1962,
            TONES.BCM_1,
            22)),
    LevelInfo(
        'পুনরুজ্জীবিত - ১৯৬৪',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '১৯',
        Puzz(
            19+1+1,
            3,
            3,
            1.377,
            'পুনরুজ্জীবিত - ১৯৬৪',
            'একুশের প্রভাতফেরীতে ভাসানী এবং শেখ মুজিব।',
            IMAGES.IMG_1964,
            TEXTS.TEXT_1964,
            VOICES.VOICE_1964,
            TONES.BCM_1,
            20)),
    LevelInfo(
      'তথাকথিত - ১৯৬৫',
      Color(0xffD76EF5),
      Color(0xff8F7AFE),
      '২০',
      Puzz(
          20+1+1,
          3,
          4,
          1.02,
          'তথাকথিত - ১৯৬৫',
          'আরমানিটোলায় বক্তৃতাদানরত শেখ মুজিবুর রহমান। ',
          IMAGES.IMG_1965,
          TEXTS.TEXT_1965,
          VOICES.VOICE_1965,
          TONES.BCM_1,
          15),
    ),
    LevelInfo(
        'মুক্তির সনদ - ১৯৬৬',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '২১',
        Puzz(
            21+1+1,
            3,
            4,
            1.307,
            'মুক্তির সনদ - ১৯৬৬',
            'ছয় দফা কর্মসূচি ঘোষণারত শেখ মুজিবুর রহমান।',
            IMAGES.IMG_1966,
            TEXTS.TEXT_1966,
            VOICES.VOICE_1966,
            TONES.BCM_1,
            22)),
    LevelInfo(
        'আগরতলা -১৯৬৮',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '২২',
        Puzz(
            22+1+1,
            3,
            4,
            0.937,
            'আগরতলা -১৯৬৮',
            'শেখ মুজিব এবং তাজউদ্দিন আহমেদ।',
            IMAGES.IMG_1968,
            TEXTS.TEXT_1968,
            VOICES.VOICE_1968,
            TONES.BCM_1,
            21)),
    LevelInfo(
        'বঙ্গবন্ধু - ১৯৬৯',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '২৩',
        Puzz(
            23+1+1,
            4,
            3,
            1.152,
            'বঙ্গবন্ধু - ১৯৬৯',
            'আগরতলা মামলায় ট্রাইব্যুনালে নিয়ে যাওয়ার পথে বঙ্গবন্ধু।',
            IMAGES.IMG_1969,
            TEXTS.TEXT_1969,
            VOICES.VOICE_1969,
            TONES.BCM_1,
            31)),
    LevelInfo(
        'নৌকা - ১৯৭০',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        '২৪',
        Puzz(
            24+1+1,
            4,
            3,
            1.867,
            'নৌকা - ১৯৭০',
            'তেজগাঁওতে নির্বাচনী জনসভায় শেখ মুজিব।',
            IMAGES.IMG_1970,
            TEXTS.TEXT_1970,
            VOICES.VOICE_1970,
            TONES.BCM_1,
            23)),
    LevelInfo(
        'এবারের সংগ্রাম -১৯৭১',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '২৫',
        Puzz(
            25+1+1+1,
            4,
            3,
            1.87,
            'এবারের সংগ্রাম -১৯৭১',
            'রেসকোর্স ময়দানের পথে বঙ্গবন্ধু।',
            IMAGES.IMG_1971,
            TEXTS.TEXT_1971,
            VOICES.VOICE_1971,
            TONES.BCM_1,
            44)),
    LevelInfo(
        'স্বদেশ প্রত্যাবর্তন  - ১৯৭২',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '২৬',
        Puzz(
            26+1+1+1,
            4,
            4,
            1.366,
            'স্বদেশ প্রত্যাবর্তন  - ১৯৭২',
            'লন্ডনে প্রথম সংবাদ সম্মেলনে বঙ্গবন্ধু।',
            IMAGES.IMG_1972,
            TEXTS.TEXT_1972,
            VOICES.VOICE_1972,
            TONES.BCM_1,
            42)),
    LevelInfo(
        ' নির্বাচন - ১৯৭৩',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '২৭',
        Puzz(
            27+1+1+1,
            4,
            4,
            1.777,
            ' নির্বাচন - ১৯৭৩',
            'ফিদেল ক্যাস্ত্রোর সঙ্গে বঙ্গবন্ধু। ',
            IMAGES.IMG_1973,
            TEXTS.TEXT_1973,
            VOICES.VOICE_1973,
            TONES.BCM_1,
            23)),
    LevelInfo(
        'জাতিসংঘ - ১৯৭৪',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '২৮',
        Puzz(
            28+1+1+1,
            4,
            4,
            1.487,
            'জাতিসংঘ - ১৯৭৪',
            'ঘূর্ণিঝড়ে বিধ্বস্ত উপকূল পরিদর্শনে বঙ্গবন্ধু ।',
            IMAGES.IMG_1974,
            TEXTS.TEXT_1974,
            VOICES.VOICE_1974,
            TONES.BCM_1,
            19)),
    LevelInfo(
        'শাহাদাত - ১৯৭৫',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        '২৯',
        Puzz(
            29+1+1+1,
            4,
            4,
            1.777,
            'শাহাদাত - ১৯৭৫',
            'বঙ্গবন্ধু শেখ মুজিবুর রহমান এবং শেখ রাসেল।',
            IMAGES.IMG_1975,
            TEXTS.TEXT_1975,
            VOICES.VOICE_1975,
            TONES.BCM_1,
            43)),
  ];

  List hfData = List();

  Future stepLocker() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lev1', 'done');
    //preferences.setString('lev13', 'done');
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
                  msg: "রিসেট সম্পন্ন হয়েছে",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Color(0xFFB40284A),
                  textColor: Colors.white,
                  fontSize: 16.0);
              preferences.setString('lev1', 'done');

            },
            child: Text(
              "ধাপ রিসেট\n    করুন",
              style: TextStyle(fontSize: 12),
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
        // centerTitle: true,
        title: Text(
          'ধাপ বাছাই করুন',
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
                            title: Text('নতুন আরেকটি ধাপ বাছাই?',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: 'Kongka',
                                    fontSize: 25)),
                            actions: <Widget>[
                              CupertinoButton(
                                child: Text('হ্যাঁ',
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
                                child: const Text('না',
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
                          title: Text('অনুগ্রহ করে পূর্বের ধাপ টি আগে খেলুন',
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontFamily: 'Kongka',
                                  fontSize: 25)),
                          actions: <Widget>[
                            CupertinoButton(
                              child: Text('আচ্ছা',
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
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kongka',
                                      fontSize: 25),
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
                                      fontFamily: 'SolaimanLipi',
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                                Text(
                                  'ধাপ',
                                  style: TextStyle(
                                      fontFamily: 'SolaimanLipi', fontSize: 26),
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
