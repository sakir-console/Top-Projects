/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amar_bangabandhu/score_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:amar_bangabandhu/EN/en_info.dart';
class ComplexModal extends StatefulWidget {
  final int step;
  final String title;
  final String imgCaption;
  final String image;
  final String texts;
  final String voice;
  final String bcMusic;
  final int bcMusicDu;
  const ComplexModal(this.step,
      this.title,this.imgCaption, this.image, this.texts, this.voice, this.bcMusic,this.bcMusicDu);

  @override
  _ComplexModalState createState() => _ComplexModalState();
}

class _ComplexModalState extends State<ComplexModal> {
  Future delay() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) =>
              info(widget.step,widget.title, widget.texts, widget.voice, widget.bcMusic,widget.bcMusicDu),
        ),
      );
    });
  }

  @override
  void initState() {
    delay();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          bool shouldClose = false;
          await showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                    title: Text('New level?',
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
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();

                          Navigator.of(context).pop();

                          setState(() {
                            ScoreWidget.of(context).allInPlaceCount = 0;
                          });
                        },
                      ),
                      CupertinoButton(
                        child: Text('No',
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
        },
        child: Navigator(
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (context) => Builder(
              builder: (context) => CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                    //leading: Container(),
                    middle: Text(widget.title,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'Kongka',
                            fontSize: 23))),
                child: SafeArea(
                  bottom: false,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white10,
                        Colors.blueGrey,
                      ],
                    )),
                    child: ListView(
                      children: [
                        Image.asset(widget.image),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(widget.imgCaption,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontFamily: 'Kongka',
                                    fontSize: 22)),
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
      ),
    );
  }
}
