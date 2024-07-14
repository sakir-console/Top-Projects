import 'dart:convert';
import 'dart:ui' as ui;
import 'package:amar_bangabandhu/utils/helpers/api.dart';
import 'package:amar_bangabandhu/values/img.dart';
import 'package:amar_bangabandhu/EN/values/qsns_j.dart';
import 'package:amar_bangabandhu/EN/values/qsns_s.dart';
import 'package:amar_bangabandhu/EN/values/qsns_y.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:amar_bangabandhu/EN/values/text.dart';
import 'package:amar_bangabandhu/EN/values/tone.dart';
import 'package:amar_bangabandhu/EN/values/voice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../en_puzzle_screen.dart';

class Segment3 extends StatefulWidget {
  @override
  _Segment3State createState() => _Segment3State();
}

class _Segment3State extends State<Segment3> {
  final double _borderRadius = 24;

  List<String> groupvalues = [];
  Map<String, dynamic> answers = {};

  final _isHours = true;

  List<T> pickRandomItemsAsList<T>(List<T> items, int count) =>
      (items.toList()..shuffle()).take(count).toList();

  // ignore: prefer_typing_uninitialized_variables
  var randomQsn;
  // ignore: prefer_typing_uninitialized_variables
  var randomOpt;
  quiz(String grp) async{

    randomQsn = pickRandomItemsAsList(grp=="jnr"?
    QUESTIONS_J.quiz_seg3_junior:grp=="yth"?QUESTIONS_Y.quiz_seg3_youth:QUESTIONS_S.quiz_seg3_senior, 6);
    print(randomQsn);
//Serial qsn:: randomQsn[INDEX]
    print("randomQsn[0]==${randomQsn[0]}");

//Serial qsn ID: randomQsn[INDEX]
    print("randomQsn[0][0]==${randomQsn[0][0]}");

//Serial wise qsn:: randomQsn[INDEX][1]
    print("randomQsn[0][1]==${randomQsn[0][1]}");

//Qsn wise answer:: randomQsn[QSN_INDEX][2]
    print("randomQsn[0][2]==${randomQsn[0][2]}");
  }

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    // onChange: (value) => print('onChange $value'),
    // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );
  bnToen(String letter) {
    switch (letter) {
      case 'A':
        {
          return 1;
        }
        break;
      case 'B':
        {
          return 2;
        }
        break;
      case 'C':
        {
          return 3;
        }
        break;
      case 'D':
        {
          return 4;
        }
        break;

    }
  }



  Future saveAns() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('seg3_ans', jsonEncode(answers));


    Fluttertoast.showToast(
        msg: "3rd Segment completed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    final yourStr = preferences.getString("seg3_ans");
    print("saved 3: ${yourStr}");
  }


  void initPrefs() async {
    for (var i = 0; i < 6; i++) {
      var _verticalGroupValue = "";
      groupvalues.add(_verticalGroupValue);
      print(i);
    }
    await Future.delayed(Duration(milliseconds: 500), () {
      //Navigator.of(context).pop();
      Flushbar(
        isDismissible: true,
        //margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(top: 5),
        borderRadius: BorderRadius.circular(8),

        backgroundGradient: LinearGradient(
          colors: [Colors.teal.shade800, Colors.tealAccent.shade700],
          stops: [0.6, 1],
        ),
        boxShadows: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(3, 3),
            blurRadius: 30,
          ),
        ],
        // All of the previous Flushbars could be dismissed by swiping down
        // now we want to swipe to the sides
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        // The default curve is Curves.easeOut
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
        titleText: Text('Be time sensible',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                //fontFamily: 'SolaimanLipi',
                fontWeight: FontWeight.bold)),

        messageText: SizedBox(
          height: 46,
          child: Container(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snap) {
                  final value = snap.data;
                  final displayTime = StopWatchTimer.getDisplayTime(value,
                      hours: false,
                      minuteRightBreak: ' Min.  ',
                      secondRightBreak: 'Sec.  ');

                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          displayTime + " ms.",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              //fontFamily: 'SolaimanLipi',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        //title: '${widget.title}',
        //message: '${widget.imgCaption}',
        /*     messageText: Text(
          '${widget.title}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white54,
              fontFamily: 'SolaimanLipi',
              fontSize: 18),
        ),*/
        duration: const Duration(seconds: 430),
      ).show(context);
    });

    // restore important things...
  }

  randomOptions(int index) {
    var randomOptx = pickRandomItemsAsList(randomQsn[index][2], 4);

    return randomOptx.toList();
  }

  Future lastmin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Set Millisecond.
    _stopWatchTimer.setPresetTime(
        mSec: int.parse(preferences.getString('PT')));

    print("আগের ধাপে সময় ===${preferences.getString('PT')}");
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
lastmin();

    SharedPreferences.getInstance().then((prefValue) => {

      setState(() {

        var grp = prefValue.getString('grp');
        quiz(grp);
        _stopWatchTimer.onExecute.add(StopWatchExecute.start);

      })
    });
  }




  @override
  void dispose() async {
    super.dispose();

    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '3rd Section: Judge yourself',
          style: TextStyle(
              color: Colors.white, fontFamily: "SolaimanLipi", fontSize: 20),
        ),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(_borderRadius),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: CustomPaint(
                            size: Size(100, 150),
                          ),
                        ),
                        Positioned.fill(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${randomQsn[index][1]}",
                                        style: const TextStyle(
                                            color: Colors.red,
                                          //  fontFamily: 'SolaimanLipi',
                                            fontSize: 18),
                                      ),
                                      RadioGroup<String>.builder(
                                        direction: Axis.vertical,
                                        groupValue: groupvalues[index],
                                        onChanged: (value) => setState(() {
                                          groupvalues[index] = value;
                                          // ignore: avoid_print
                                          print(groupvalues[index]);
                                          print(groupvalues);

                                          Map<String, dynamic> ansBody = {
                                            "${randomQsn[index][0]}":
                                            bnToen(groupvalues[index].split('.')[0]),
                                          };
                                          answers.addAll(ansBody);

                                          print(answers);

                                        }),
                                        items: [
                                          "A. ${randomQsn[index][2][0][1]}",
                                          "B. ${randomQsn[index][2][1][1]}",
                                          "C. ${randomQsn[index][2][2][1]}",
                                          "D. ${randomQsn[index][2][3][1]}",
                                        ],
                                        itemBuilder: (item) =>
                                            RadioButtonBuilder(item),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () async {
                // checkReg();
                _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                _stopWatchTimer.rawTime.listen((value) async {

                  SharedPreferences preferences =
                  await SharedPreferences.getInstance();
                  preferences.setString( 'PT', '$value');
                });


                saveAns();

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Puzz(
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
                    26)));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepOrangeAccent,
                        Colors.deepPurpleAccent
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Next Section',
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: "SolaimanLipi",
                        fontSize: 22),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 140,
            )
          ],
        ),
      ),
    );
  }
}

class PlaceInfo {
  final String question;
  final String correctANs;

  final Color startColor;
  final Color endColor;

  PlaceInfo(this.question, this.correctANs, this.startColor, this.endColor);
}

class Answers {
  String ans1;
  String ans2;
  String ans3;
  String ans4;

  Answers(this.ans1, this.ans2, this.ans3, this.ans4);
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
