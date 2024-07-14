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
import 'package:amar_bangabandhu/puzzles/puzzle_screen.dart';
import 'package:amar_bangabandhu/score_widget.dart';
import 'package:amar_bangabandhu/values/img.dart';
import 'package:amar_bangabandhu/values/text.dart';
import 'package:amar_bangabandhu/values/tone.dart';
import 'package:amar_bangabandhu/values/voice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/questions/segment_1.dart';
import 'screens/questions/segment_2.dart';
import 'screens/questions/segment_3.dart';
import 'screens/questions/segment_4.dart';
import 'screens/questions/segment_5.dart';
import 'home_page.dart';
import 'infoModal/extra_info_modal.dart';

class info extends StatefulWidget {
  final int step;
  final String title;
  final String texts;
  final String voice;
  final String bcMusic;
  final int bcMusicDu;
  info(this.step, this.title, this.texts, this.voice, this.bcMusic,
      this.bcMusicDu);
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  var items = [
    //Items 0--------
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
    //Items 1--------
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
    //Items[2]-------->step-3
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
    //Items 5--------
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
    //Items[6]--------step-7
    LevelInfo(' Question Segment 1', Color(0xff6DC8F3), Color(0xff73A1F9),
        'QSN 1', Segment1()),
    //Items[7]-------->step-8
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

    //Items[10]--------step-11
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
    //Items[11]--------step-12
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

    //Items[12]--------step-13
    LevelInfo(' Question Segment 2', Color(0xff6DC8F3), Color(0xff73A1F9),
        'QSN 2', Segment2()),
    //Items[13]--------step-14
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

    //Items[14]-------->step-14
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
    LevelInfo(' Question Segment 3', Color(0xff6DC8F3), Color(0xff73A1F9),
        'QSN 3', Segment3()),
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
    LevelInfo(' Question Segment 4', Color(0xff6DC8F3), Color(0xff73A1F9),
        'QSN 4', Segment4()),
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
    LevelInfo(' Question Segment 4', Color(0xff6DC8F3), Color(0xff73A1F9),
        'QSN 4', Segment5()),
  ];

  AudioPlayer advancedPlayer = AudioPlayer();

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache audioCache = AudioCache(fixedPlayer: advancedPlayer);

    return await audioCache.play('audios/${widget.voice}', volume: 1);
  }

  Future delay() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lev''${widget.step + 1}', 'done');
    AudioPlayer naPlayer = AudioPlayer();
    await Future.delayed(Duration(seconds: widget.bcMusicDu), () {
      //shouldClose = true;
      Navigator.of(context).pop();
      Navigator.of(context).pop();

      Navigator.of(context).pop();

      setState(() {
        ScoreWidget.of(context).allInPlaceCount = 0;
      });
      print("step===========${widget.step}");

      naPlayer.stop();

      Navigator.of(context,rootNavigator: true).push(
        CupertinoPageRoute(
          builder: (context) => items[widget.step].location,
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.playLocalAsset();
    this.delay();
  }

  @override
  void dispose() {
    advancedPlayer.dispose();
    //advancedPlayer.stop();

    print("DISPOSE CONTROLLER...");

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Material(
      child: Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (context) => Builder(
            builder: (context) => CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                  // leading: Container(),
                  middle: Text(widget.title,
                      style: TextStyle(
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
