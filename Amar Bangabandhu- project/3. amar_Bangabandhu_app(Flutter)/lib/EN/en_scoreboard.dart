/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/




import 'package:amar_bangabandhu/EN/values/tone.dart';
import 'package:amar_bangabandhu/utils/helpers/api.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class EnScoreboard extends StatefulWidget {
  @override
  State<EnScoreboard> createState() => _EnScoreboardState();
}

class _EnScoreboardState extends State<EnScoreboard> {
  AudioPlayer naPlayer = AudioPlayer();

  Future<AudioPlayer> naPlay() async {
    AudioCache audioCache = AudioCache(fixedPlayer: naPlayer);

    return await audioCache.loop('audios/${TONES.JB}', volume: 1);
  }

  @override
  void dispose() async {
    super.dispose();
    naPlayer.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.naPlay();
  }

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
                opacity: 1,
                child: Image.asset(
                  'assets/icons/bg.png',
                  colorBlendMode: BlendMode.colorBurn,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ScoreScreen()
          ],
        ),
      ),
    );
  }
}

class ScoreScreen extends StatefulWidget {
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  List performaces = [];
  bool isLoading = true;
  //View Slider list
  Future myPerformances() async {
    var data = await getApi("leaderboard");
    if (data['data'] != null) {
      if (data['result'] == true) {
        for (int i = 0; i < data['data'].length; i++) {
          setState(() {
            performaces.add(data['data'][i]);
          });
        }
        setState(() {
          isLoading = false;
        });
      } else {
        Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myPerformances();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Scoreboard',
              style: TextStyle(
                  fontFamily: 'Kongka',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.redAccent, Colors.deepPurple])),
          ),
        ),
        body: Container(
          child: ListView(children: <Widget>[
            Center(
              child: Container(
margin: EdgeInsets.only(top: 15),
                  child: isLoading
                      ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 12.0,right: 12),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            child:Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              enabled: true,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(children: [
                                          Container(
                                              width: 45,
                                              height: 45,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: Image.asset('assets/icons/lb.jpg'),
                                              )),
                                          SizedBox(width: 10),
                                          Flexible(
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.all(2),
                                                    width: 140,
                                                    height: 14.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(12)),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(2),
                                                    width: 100,
                                                    height: 14.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(12)),
                                                  ),
                                                ]),
                                          )
                                        ]),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: AnimatedContainer(
                                            height: 35,
                                            padding: EdgeInsets.all(5),
                                            duration: Duration(milliseconds: 300),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: Colors.red.shade100)),
                                            child: Center(child: Text('      '))),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 15),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: Colors.grey.shade200),
                                              child: Text(
                                                'Quiz Correct: 46',
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 15),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: Colors.grey.shade200),
                                              child: Text(
                                                'Time: 4664645 Sec',
                                                style: TextStyle(
                                                    color: Color(int.parse("0xffff0000"))),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                      : performaces.isEmpty
                      ? Center(
                    child: Text(
                      'No Score Found. Play the Game and win prizes.',
                    ),
                  )
                      : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: performaces.length,
                      itemBuilder: (context, i) {
                        return  Padding(
                          padding: const EdgeInsets.only(left: 12.0,right: 12),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(children: [
                                        Container(
                                            width: 45,
                                            height: 45,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.asset('assets/icons/lb.jpg'),
                                            )),
                                        SizedBox(width: 10),
                                        Flexible(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('${performaces[i]['mark']} ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w500)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text('Total mark',
                                                    style:
                                                    TextStyle(color: Colors.grey[500])),
                                              ]),
                                        )
                                      ]),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: AnimatedContainer(
                                          height: 35,
                                          padding: EdgeInsets.all(5),
                                          duration: Duration(milliseconds: 300),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(color: Colors.red.shade100)),
                                          child: Center(child: Text('  ${i + 1}  '))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 15),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: Colors.grey.shade200),
                                            child: Text(
                                              'Quiz Correct: ${performaces[i]['correct_ans'] ?? '0'} ',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 15),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: Color(int.parse("0xffff0000"))
                                                    .withAlpha(20)),
                                            child: Text(
                                              'Time: ${performaces[i]['duration']} Sec.',
                                              style: TextStyle(
                                                  color: Color(int.parse("0xffff0000"))),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
            ),
            SizedBox(
              height: 8,
            ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text('Know your Country, District ranking, prizes at..\n',style: GoogleFonts.ubuntu(fontSize: 15),),
            InkWell(onTap: ()async{
              await canLaunch('https://amarbangabandhu.app')
                  ? launch(
                'https://amarbangabandhu.app',
                forceSafariVC: false,
                forceWebView: false,
              )
                  : launch(
               'https://amarbangabandhu.app',
                forceSafariVC: false,
                forceWebView: false,
              );
            },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 8, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(int.parse("0xff0000ff"))
                        .withAlpha(20)),
                child: Text(
                  'www.amarbangabandhu.app',
                  style: TextStyle(
                      color: Color(int.parse("0xffff0000"))),
                ),
              ),
            )
          ],
        ),
      ),
            SizedBox(height: 15,)
          ]),
        ),
      ),
    );
  }
}
