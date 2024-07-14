/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:amar_bangabandhu/utils/helpers/api.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:amar_bangabandhu/infoModal/modal_with_page_view.dart';
import 'package:amar_bangabandhu/puzzle_piece.dart';
import 'package:amar_bangabandhu/puzzles/step_screen.dart';
import 'package:amar_bangabandhu/score_widget.dart';
import 'package:amar_bangabandhu/values/tone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:amar_bangabandhu/EN/en_corret_overlay.dart';

class Puzz extends StatefulWidget {
  int step;
  int rows;
  int cols;
  double gridRatio;
  String title;
  String imgCaption;
  String image;
  String texts;
  String voice;
  String bcMusic;
  int bcMusicDu;

  Puzz(
      this.step,
      this.rows,
      this.cols,
      this.gridRatio,
      this.title,
      this.imgCaption,
      this.image,
      this.texts,
      this.voice,
      this.bcMusic,
      this.bcMusicDu);

  @override
  _PuzzState createState() => _PuzzState();
}

class _PuzzState extends State<Puzz> {
  AudioPlayer bcm = AudioPlayer();
  bool bcVol=true;
  Future<AudioPlayer> bcPlay() async {
    AudioCache audioCache = AudioCache(fixedPlayer: bcm);

    return await audioCache.play('audios/${TONES.BCM_1}', volume: 0.03);
  }


  List<Widget> pieces = [];

  var playTime;
  bool _overlayVisible = true;

  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    //   onChange: (value) => print('onChange $value'),
    // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    //  onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  final _scrollController = ScrollController();
  bnToen(int num) {
    switch (num) {
      case 1:
        {
          return '1';
        }
        break;
      case 2:
        {
          return '2';
        }
        break;
      case 3:
        {
          return '3';
        }
        break;
      case 4:
        {
          return '4';
        }
        break;
      case 5:
        {
          return '5';
        }
        break;
      case 6:
        {
          return '6';
        }
        break;
      case 7:
        {
          return '7';
        }
        break;
      case 8:
        {
          return '8';
        }
        break;
      case 9:
        {
          return '9';
        }
        break;
      case 10:
        {
          return '10';
        }
        break;
      case 11:
        {
          return '11';
        }
        break;
      case 12:
        {
          return '12';
        }
        break;
      case 13:
        {
          return '13';
        }
        break;
      case 14:
        {
          return '14';
        }
        break;
      case 15:
        {
          return '15';
        }
        break;
      case 16:
        {
          return '16';
        }
        break;
      case 17:
        {
          return '17';
        }
        break;
      case 18:
        {
          return '18';
        }
        break;
      case 19:
        {
          return '19';
        }
        break;
      case 20:
        {
          return '20';
        }
        break;
      case 21:
        {
          return '21';
        }
        break;
      case 22:
        {
          return '22';
        }
        break;
      case 23:
        {
          return '23';
        }
        break;
      case 24:
        {
          return '24';
        }
        break;
      case 25:
        {
          return '25';
        }
        break;
      case 26:
        {
          return '26';
        }
        break;
      case 27:
        {
          return '27';
        }
        break;
      case 28:
        {
          return '28';
        }
        break;
      case 29:
        {
          return '29';
        }
        break;
    }
  }

  Future startTime() async {
    if (widget.step == 1) {
      var data = await postApi("play-start", {});

      if (data['result'] == true) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('season_id', data['data'].toString());

        Fluttertoast.showToast(
            msg: "${data['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        //Navigator.of(context, rootNavigator: true).pop(context);

        Fluttertoast.showToast(
            msg: "Unable to start the timing.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color(0xFFB40284A),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
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
    startTime();

    print("Level Number====${widget.step}");
    print("Level Number====$playTime");
    lastmin();
    print("Actual Step num-----------------${widget.step}");
    BackButtonInterceptor.add(myInterceptor);
    initPrefs();
    bcPlay();
/*
    _stopWatchTimer.rawTime.listen((value) => print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));*/
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  void initPrefs() async {
    await Future.delayed(new Duration(milliseconds: 100), () {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => AssetGiffyDialog(
                onlyOkButton: true,
                buttonOkText: Text(
                  '${widget.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 22),
                ),
                image: Image.asset(
                  'assets/images/anim.gif',
                  fit: BoxFit.fitWidth,
                ),
                title: Text(
                  'Level- ${widget.step <= 12 ? bnToen(widget.step) : (13 <= widget.step && widget.step <= 19) ? bnToen(widget.step - 1) : (widget.step >= 20 && widget.step <= 26) ? bnToen(widget.step - 2) : bnToen(widget.step - 3)}',
                  style: TextStyle(
                      color: Colors.pink,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 38),
                ),
                description: Text(
                  ' Game starting...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 26),
                ),
                entryAnimation: EntryAnimation.BOTTOM_RIGHT,
                onOkButtonPressed: () {},
              ));
    });
    await Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pop();
      Flushbar(
        isDismissible: false,
        onStatusChanged: (yu) {
          print("----------------------------------------$yu");
        },
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.only(top: 5),
        borderRadius: BorderRadius.circular(8),
        backgroundGradient: LinearGradient(
          colors: [Colors.teal.shade800, Colors.tealAccent.shade700],
          stops: const [0.6, 1],
        ),
        boxShadows: const [
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
        titleText: Text(
          widget.imgCaption,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontFamily: 'SolaimanLipi', fontSize: 20),
        ),

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
                      secondRightBreak: 'Sec .  ');

                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          displayTime + " Min. Sec.",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'SolaimanLipi',
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
        duration: Duration(seconds: 630),
      ).show(context);
    });

    setState(() {
      pieces.clear();
    });
    splitImage(Image.asset(widget.image));

    // restore important things...
  }

  @override
  void dispose() async {
    super.dispose();
    BackButtonInterceptor.remove(myInterceptor);
    bcm.dispose();
    await _stopWatchTimer.dispose();
  }

  Future askBefore() async {
    bool shouldClose = false;
    await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('New level?',
                  style: TextStyle(
                      color: Colors.blue, fontFamily: 'Kongka', fontSize: 25)),
              actions: <Widget>[
                CupertinoButton(
                  child: const Text('YES',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontFamily: 'Kongka',
                          fontSize: 25)),
                  onPressed: () {
                    shouldClose = true;
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();

                    setState(() {
                      ScoreWidget.of(context).allInPlaceCount = 0;
                    });
                  },
                ),
                CupertinoButton(
                  child: const Text('NO',
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
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    askBefore();
    return true;
  }

  // we need to find out the image size, to be used in the PuzzlePiece widget
  Future<Size> getImageSize(Image image) async {
    final Completer<Size> completer = Completer<Size>();

    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(
          Size(info.image.width.toDouble(), info.image.height.toDouble()));
    }));

    final Size imageSize = await completer.future;

    return imageSize;
  }

  bnNumConvert(int num) {
    switch (num) {
      case 1:
        {
          return '1st Piece';
        }
        break;
      case 2:
        {
          return '';
        }
        break;
      case 3:
        {
          return '';
        }
        break;
      case 4:
        {
          return '4th Piece';
        }
        break;
      case 5:
        {
          return '';
        }
        break;
      case 6:
        {
          return '';
        }
        break;
      case 7:
        {
          return '7th Piece';
        }
        break;
      case 8:
        {
          return '';
        }
        break;
      case 9:
        {
          return '';
        }
        break;
      case 10:
        {
          return '10th Piece';
        }
        break;
      case 11:
        {
          return '';
        }
        break;
      case 12:
        {
          return '';
        }
        break;
      case 13:
        {
          return '';
        }
        break;
      case 14:
        {
          return '14th Piece';
        }
        break;
      case 15:
        {
          return '';
        }
        break;
      case 16:
        {
          return '';
        }
        break;
      case 17:
        {
          return '17th Piece';
        }
        break;
      case 18:
        {
          return '';
        }
        break;
      case 19:
        {
          return '';
        }
        break;
      case 20:
        {
          return '20th Piece';
        }
        break;
    }
  }

  // here we will split the image into small pieces
  // using the rows and columns defined above; each piece will be added to a stack
  void splitImage(Image image) async {
    Size imageSize = await getImageSize(image);

    for (int x = 0; x < widget.rows; x++) {
      for (int y = 0; y < widget.cols; y++) {
        setState(() {
          pieces.add(
            PuzzlePiece(
              key: GlobalKey(),
              image: image,
              imageSize: imageSize,
              row: x,
              col: y,
              maxRow: widget.rows,
              maxCol: widget.cols,
              bringToTop: this.bringToTop,
              sendToBack: this.sendToBack,
            ),
          );
        });
      }
    }
  }

  // when the pan of a piece starts, we need to bring it to the front of the stack
  void bringToTop(Widget widget) {
    setState(() {
      pieces.remove(widget);
      pieces.add(widget);
    });
  }

// when a piece reaches its final position,
// it will be sent to the back of the stack to not get in the way of other, still movable, pieces
  void sendToBack(Widget widget) {
    setState(() {
      pieces.remove(widget);
      pieces.insert(0, widget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bc.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Stack(
          children: [
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.cols,
                  childAspectRatio: widget.gridRatio),
              children: List.generate((widget.cols * widget.rows),
                  (index) => AssistiveGrid(bnNumConvert(index + 1))),
            ),
            widget.image == null
                ? Center(child: Text('No image selected.'))
                : ScoreWidget.of(context).allInPlaceCount ==
                        widget.rows * widget.cols
                    ? Overlay(
                        initialEntries: [
                          OverlayEntry(builder: (context) {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.stop);

                            _stopWatchTimer.rawTime.listen((value) async {
                              print(
                                  'Spent time=======getDisplayTime ${value * 1000} ${StopWatchTimer.getDisplayTime(value)}');
                              print(
                                  'Spent time=======getDisplayTimeHours= $value ${StopWatchTimer.getDisplayTimeHours(value)}');
                              print(
                                  'Spent time========getDisplayTimeMillisecond= $value ${StopWatchTimer.getDisplayTimeMillisecond(value)}');
                              print(
                                  'Spent time=======getDisplayTimeMinute== $value ${StopWatchTimer.getDisplayTimeMinute(value)}');
                              print(
                                  'Spent time=========getMilliSecFromSecond $value ${StopWatchTimer.getMilliSecFromSecond(value)}');
                              print(
                                  'Spent time========getMinute= $value ${StopWatchTimer.getMinute(value)}');
                              print(
                                  'Spent time========getRawSecond= $value ${StopWatchTimer.getRawSecond(value)}');
                              print(
                                  'Spent time========getDisplayTimeHours= $value ${StopWatchTimer.getDisplayTimeHours(value)}');
                              print('Spent time========getRawMinute= $value');
                              SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                              preferences.setString( 'PT', '$value');
                            });

                            return WillPopScope(
                              onWillPop: () async => false,
                              child: CorrectOverlay(widget.step, true,
                                  () async {
                                setState(() {
                                  ScoreWidget.of(context).allInPlaceCount = 0;
                                });
                              },
                                  widget.title,
                                  widget.imgCaption,
                                  widget.image,
                                  widget.texts,
                                  widget.voice,
                                  widget.bcMusic,
                                  widget.bcMusicDu),
                            );
                          })
                        ],
                      )
                    : Stack(
                        children: pieces,
                      ),
          ],
        )) /* add child content here */,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 0, bottom: 80),
        child: FloatingActionButton.small(
          child: bcVol?Icon(FontAwesomeIcons.volumeUp):Icon(FontAwesomeIcons.volumeMute),
          backgroundColor: Colors.teal,
          onPressed: () {
            setState(() {
              bcVol=false;
            });

            bcm.pause();
            },
        ),
      ),
    ));
  }
}

class AssistiveGrid extends StatelessWidget {
  String alt;
  AssistiveGrid(this.alt);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(1.0),
      ),
      child: Center(
        child: Text('$alt',
            style: TextStyle(
                fontFamily: 'Kongka',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  }
}
