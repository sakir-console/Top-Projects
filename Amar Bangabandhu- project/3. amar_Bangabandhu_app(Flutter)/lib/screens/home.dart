/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'dart:io';

import 'package:amar_bangabandhu/profile.dart';
import 'package:amar_bangabandhu/screens/questions/segment_1.dart';
import 'package:amar_bangabandhu/screens/questions/segment_2.dart';
import 'package:amar_bangabandhu/screens/questions/segment_3.dart';
import 'package:amar_bangabandhu/screens/questions/segment_4.dart';
import 'package:amar_bangabandhu/screens/questions/segment_5.dart';
import 'package:amar_bangabandhu/screens/scoreboard.dart';
import 'package:amar_bangabandhu/showcase.dart';
import 'package:amar_bangabandhu/values/tone.dart';
import 'package:amar_bangabandhu/widgets/fab.dart';
import 'package:amar_bangabandhu/widgets/fab_menu.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../about.dart';
import '../home_page.dart';
import '../rules.dart';
import 'package:amar_bangabandhu/widgets/fab.dart';

import '../setting.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer naPlayer = AudioPlayer();

  Future<AudioPlayer> naPlay() async {
    AudioCache audioCache = AudioCache(fixedPlayer: naPlayer);

    return await audioCache.loop('audios/${TONES.NA_28JUNE}', volume: 1);
  }

  final List<Map<dynamic, dynamic>> icons = [
    {
      'name': 'website',
      'launchUrl': 'https://amarbangabandhu.app/',
      'backupUrl': 'https://amarbangabandhu.app',
    },
    {
      'name': 'youtube',
      'launchUrl': 'youtube://UC3F3rkrQdLT4ycU385l4fkw',
      'backupUrl': 'https://youtube.com/channel/UC3F3rkrQdLT4ycU385l4fkw',
    },
    {
      'name': 'facebook',
      'launchUrl': 'fb://page/105803808608857',
      'backupUrl': 'https://www.facebook.com/amarbangabandhu.game/',
    },
    {
      'name': 'setting',
      'launchUrl': 'https://amarbangabandhu.app/',
      'backupUrl': 'https://amarbangabandhu.app',
    },
    {
      'name': 'profile',
      'launchUrl': 'https://test.amarbangabandhu.app/player/setting',
      'backupUrl': 'https://test.amarbangabandhu.app/player/setting',
    },
    {
      'name': 'top',
      'launchUrl': 'https://test.amarbangabandhu.app/player/setting',
      'backupUrl': 'https://test.amarbangabandhu.app/player/setting',
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.naPlay();
    //WidgetsBinding.instance.addObserver(this);

    @override
    void didChangeAppLifecycleState(AppLifecycleState state) {
      if (state == AppLifecycleState.paused) {
        naPlayer.stop();
      } else {
        print(state.toString());
      }
    }
  }

  @override
  void dispose() {
    naPlayer.dispose();
    //advancedPlayer.stop();

    print("DISPOSE CONTROLLER...");

    super.dispose();
  }

  Future<bool> showExitPopup() async {
    AudioPlayer naPlayer = AudioPlayer();

    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('বাহির',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: 'SolaimanLipi',
                    fontSize: 26)),
            content: Text('আপনি কি অ্যাপসটি বন্ধ করতে চান?',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontFamily: 'SolaimanLipi',
                    fontSize: 17)),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('না',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Kongka',
                        fontSize: 25)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                onPressed: () {
                  exit(0);
                  //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  // SystemNavigator.pop();
                },
                //return true when click on "Yes"
                child: Text('হ্যাঁ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Kongka',
                        fontSize: 25)),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.deepPurple));*/
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Color(0xfffe494d)],
                ),
              ),
            ),
            // backgroundColor: Colors.red,
            // ignore: deprecated_member_use
            brightness: Brightness.light,
            elevation: 0.0,
            toolbarHeight: 0.0, // Hide the AppBar
          ),
          body: HawkFabMenu(
            icon: AnimatedIcons.menu_home,
            fabColor: Colors.pinkAccent,
            iconColor: Colors.white,
            items: [
              HawkFabMenuItem(
                labelBackgroundColor: Colors.indigo,
                label: 'সেরা প্রতিযোগী',
                ontap: () async {
                  naPlayer.stop();
                  FlutterWebBrowser.openWebPage(
                    url: "https://amarbangabandhu.app/ranking",
                    customTabsOptions: const CustomTabsOptions(
                      colorScheme: CustomTabsColorScheme.dark,
                      darkColorSchemeParams: CustomTabsColorSchemeParams(
                        toolbarColor: Colors.deepPurple,
                        secondaryToolbarColor: Colors.green,
                        navigationBarColor: Colors.amber,
                        navigationBarDividerColor: Colors.cyan,
                      ),
                      shareState: CustomTabsShareState.off,
                      instantAppsEnabled: true,
                      showTitle: false,
                      urlBarHidingEnabled: true,
                    ),
                  );
                },
                icon: const Icon(FontAwesomeIcons.star),
                color: Colors.indigo,
                labelColor: Colors.white,
              ),
              HawkFabMenuItem(
                labelBackgroundColor: Colors.deepPurple[400],
                label: 'পুরষ্কার সমূহ',
                ontap: () async {
                  naPlayer.stop();

                  FlutterWebBrowser.openWebPage(
                    url: "https://amarbangabandhu.app/prizes",
                    customTabsOptions: const CustomTabsOptions(
                      colorScheme: CustomTabsColorScheme.dark,
                      darkColorSchemeParams: CustomTabsColorSchemeParams(
                        toolbarColor: Colors.deepPurple,
                        secondaryToolbarColor: Colors.green,
                        navigationBarColor: Colors.amber,
                        navigationBarDividerColor: Colors.cyan,
                      ),
                      shareState: CustomTabsShareState.off,
                      instantAppsEnabled: true,
                      showTitle: false,
                      urlBarHidingEnabled: true,
                    ),
                  );
                },
                icon: const Icon(FontAwesomeIcons.gift),
                color: Colors.deepPurple,
                labelColor: Colors.white,
              ),
              HawkFabMenuItem(
                label: 'ওয়েবসাইট',
                ontap: () async {
                  naPlayer.stop();
                  await canLaunch(icons[0]['launchUrl'])
                      ? launch(
                          icons[0]['launchUrl'],
                          forceSafariVC: false,
                          forceWebView: false,
                        )
                      : launch(
                          icons[0]['backupUrl'],
                          forceSafariVC: false,
                          forceWebView: false,
                        );
                },
                icon: const Icon(FontAwesomeIcons.globe),
                color: Colors.blueGrey,
                labelColor: Colors.blue,
              ),
              HawkFabMenuItem(
                label: 'ইউটিউব',
                ontap: () async {
                  naPlayer.stop();
                  await canLaunch(icons[1]['launchUrl'])
                      ? launch(
                          icons[1]['launchUrl'],
                          forceSafariVC: false,
                          forceWebView: false,
                        )
                      : launch(
                          icons[1]['backupUrl'],
                          forceSafariVC: false,
                          forceWebView: false,
                        );
                },
                icon: const Icon(FontAwesomeIcons.youtube),
                color: Colors.red,
                labelColor: Colors.white,
                labelBackgroundColor: Colors.red,
              ),
              HawkFabMenuItem(
                label: 'ফেসবুক',
                ontap: () async {
                  naPlayer.stop();
                  await canLaunch(icons[2]['launchUrl'])
                      ? launch(
                          icons[2]['launchUrl'],
                          forceSafariVC: false,
                          forceWebView: false,
                        )
                      : launch(
                          icons[2]['backupUrl'],
                          forceSafariVC: false,
                          forceWebView: false,
                        );
                },
                icon: const Icon(FontAwesomeIcons.facebookF),
                labelColor: Colors.white,
                labelBackgroundColor: Colors.blue,
              ),
            ],
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 900,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper3(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper1(),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/aw.png',
                                height: 55,
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              FontAwesomeIcons.puzzlePiece,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Text(
                            "আমার বঙ্গবন্ধু",
                            style: TextStyle(
                                fontFamily: 'Kongka',
                                color: Colors.white,
                                //fontWeight: FontWeight.w700,
                                fontSize: 30),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "amarbangabandhu.app",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.indigo, Color(0xfffe494d)])),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Positioned(
                      right: -80,
                      child: Image.asset(
                        'assets/icons/muj.png',
                        height: 390,
                      )),
                  const SizedBox(
                    height: 200,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 225,
                      ),
                      DelayedDisplay(
                          delay: const Duration(seconds: 1),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: GradientColors.purplePink,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                naPlayer.stop();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => About()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Container(
                                width: 200,
                                height: 40,
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Icon(Icons.account_balance_wallet_outlined),
                                    SizedBox(
                                      width: 28,
                                    ),
                                    Text(
                                      'গেম সম্পর্কিত',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'SolaimanLipi',
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          fadingDuration: const Duration(milliseconds: 1500),
                          slidingBeginOffset: const Offset(-1.0, 0)),
                      const SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DelayedDisplay(
                            delay: const Duration(seconds: 1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: GradientColors.orangePink,
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  naPlayer.stop();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onSurface: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Container(
                                  width: 200,
                                  height: 40,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.play_circle_fill),
                                      SizedBox(
                                        width: 28,
                                      ),
                                      Text(
                                        'শুরু করুন',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'SolaimanLipi',
                                            fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            fadingDuration: const Duration(milliseconds: 1500),
                            slidingBeginOffset: const Offset(1.0, -0)),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      DelayedDisplay(
                          delay: const Duration(seconds: 1),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: MoreGradientColors.instagram,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                naPlayer.stop();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Rules()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Container(
                                width: 200,
                                height: 40,
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Icon(Icons.rule),
                                    SizedBox(
                                      width: 28,
                                    ),
                                    Text(
                                      'নিয়মাবলী',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'SolaimanLipi',
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          fadingDuration: const Duration(milliseconds: 1500),
                          slidingBeginOffset: const Offset(-1.0, 0)),
                      const SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DelayedDisplay(
                            delay: const Duration(seconds: 1),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: MoreGradientColors.instagram,
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  naPlayer.stop();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Scoreboard()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onSurface: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Container(
                                  width: 200,
                                  height: 40,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.star_rate_outlined),
                                      SizedBox(
                                        width: 28,
                                      ),
                                      Text(
                                        'সাফল্যাঙ্ক',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'SolaimanLipi',
                                            fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            fadingDuration: const Duration(milliseconds: 1500),
                            slidingBeginOffset: const Offset(1.0, -0)),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      DelayedDisplay(
                          delay: const Duration(seconds: 1),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: GradientColors.orangePink,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                naPlayer.stop();

                                naPlayer.stop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Setting()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Container(
                                width: 200,
                                height: 40,
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Icon(Icons.settings),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'প্রোফাইল & সেটিংস',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'SolaimanLipi',
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          fadingDuration: const Duration(milliseconds: 1500),
                          slidingBeginOffset: const Offset(-1.0, 0)),
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 1, right: 1, bottom: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/icons/govt.png',
                                height: 48,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'বাস্তবায়নে',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                              const Text(
                                'মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয়',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.blueGrey),
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
                                'পরিকল্পনা ও সার্বিক তত্ত্ববধানে',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                              const Text(
                                'বিএনসিসি',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CustomPaint(
                        painter: FooterPainter(),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 2.7,
                            height: 100)),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 30);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class FooterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = Colors.orange.withOpacity(0.3);
    path = Path();
    path.lineTo(size.width, size.height / 5);
    path.cubicTo(size.width, size.height / 15, size.width * 0.94,
        size.height * 0.88, size.width * 0.65, size.height * 0.93);
    path.cubicTo(size.width * 0.36, size.height * 0.97, size.width / 5,
        size.height, size.width / 5, size.height);
    path.cubicTo(size.width / 5, size.height, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height / 5,
        size.width, size.height / 5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class WaveClipper4 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
