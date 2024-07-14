/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/




import 'package:amar_bangabandhu/widgets/fab_menu.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Developers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text("ডেভেলপার'স প্যানেল",
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
                    colors: <Color>[Colors.indigo, Colors.teal])),
          ),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(15),
              child: ListView(
                children: <Widget>[
                  SlimyCard(
                    color: Colors.grey[500],
                    width: MediaQuery.of(context).size.width,
                    topCardHeight: 150,
                    bottomCardHeight: 145,
                    borderRadius: 15,
                    topCardWidget: Top1(),
                    bottomCardWidget: Bottom1(),
                    slimeEnabled: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SlimyCard(
                    color: Colors.blueGrey,
                    width: MediaQuery.of(context).size.width,
                    topCardHeight: 150,
                    bottomCardHeight: 120,
                    borderRadius: 15,
                    topCardWidget: Top2(),
                    bottomCardWidget: Bottom2(),
                    slimeEnabled: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SlimyCard(
                    color: Colors.blueGrey,
                    width: MediaQuery.of(context).size.width,
                    topCardHeight: 150,
                    bottomCardHeight: 120,
                    borderRadius: 15,
                    topCardWidget: Top3(),
                    bottomCardWidget: Bottom3(),
                    slimeEnabled: true,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class Top1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/dev/zahir.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ইঞ্জিঃ মো. জহিরুল ইসলাম',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 18),
                ),
                Text(
                  'মেন্টর',
                  style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 22),
                ),
                Text(
                  'আমার বঙ্গবন্ধু গেম',
                  style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 22),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bottom1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('সহকারী অধ্যাপক,\nড্যাফোডিল ইন্টারন্যাশনাল ইউনিভার্সিটি',    style: TextStyle(
                color: Colors.white,
                fontFamily: 'SolaimanLipi',
                fontSize: 18),),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GFButton(
                  onPressed: () async {
                    await canLaunch(
                            'fb://facewebmodal/f?href=https://www.facebook.com/zahirul.iislam')
                        ? launch(
                            'fb://facewebmodal/f?href=https://www.facebook.com/zahirul.iislam',
                            forceSafariVC: false,
                            forceWebView: false,
                            universalLinksOnly: true,
                          )
                        : launch(
                            'https://www.facebook.com/zahirul.iislam/',
                            forceSafariVC: false,
                            forceWebView: false,
                          );
                  },
                  text: 'ফেসবুক   ',
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  shape: GFButtonShape.pills),
            )
          ],
        ),
      ),
    );
  }
}

class Top2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/dev/sakir.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'সাকায়েত সাকির',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 20),
                ),
                Text(
                  'ডেভেলপার',
                  style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 20),
                ),
                Text(
                  'আমার বঙ্গবন্ধু গেম',
                  style: TextStyle(
                      color: Colors.cyan[600],
                      fontFamily: 'SolaimanLipi',
                      fontSize: 22),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bottom2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('চট্টগ্রাম প্রকৌশল বিশ্ববিদ্যালয়',    style: TextStyle(
                color: Colors.white,
                fontFamily: 'SolaimanLipi',
                fontSize: 18),),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GFButton(
                  onPressed: () async {
                    await canLaunch(
                        'fb://facewebmodal/f?href=https://www.facebook.com/sakir.me')
                        ? launch(
                      'fb://facewebmodal/f?href=https://www.facebook.com/sakir.me',
                      forceSafariVC: false,
                      forceWebView: false,
                      universalLinksOnly: true,
                    )
                        : launch(
                      'https://www.facebook.com/sakir.me',
                      forceSafariVC: false,
                      forceWebView: false,
                    );
                  },
                  text: 'ফেসবুক   ',
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  shape: GFButtonShape.pills),
            )
          ],
        ),
      ),
    );
  }
}

class Top3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/dev/nokib.jpeg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'তানজীম খান নকিব',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 18),
                ),
                Text(
                  'ডেভেলপার',
                  style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'SolaimanLipi',
                      fontSize: 20),
                ),
                Text(
                  'আমার বঙ্গবন্ধু গেম',
                  style: TextStyle(
                      color: Colors.cyan[600],
                      fontFamily: 'SolaimanLipi',
                      fontSize: 22),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bottom3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('ড্যাফোডিল ইন্টারন্যাশনাল ইউনিভার্সিটি',    style: TextStyle(
                color: Colors.white,
                fontFamily: 'SolaimanLipi',
                fontSize: 18),),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GFButton(
                  onPressed: () async {
                    await canLaunch(
                        'fb://facewebmodal/f?href=https://www.facebook.com/tanjimkhan.nokib.39')
                        ? launch(
                      'fb://facewebmodal/f?href=https://www.facebook.com/tanjimkhan.nokib.39',
                      forceSafariVC: false,
                      forceWebView: false,
                      universalLinksOnly: true,
                    )
                        : launch(
                      'https://www.facebook.com/tanjimkhan.nokib.39',
                      forceSafariVC: false,
                      forceWebView: false,
                    );
                  },
                  text: 'ফেসবুক   ',
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  shape: GFButtonShape.pills),
            )
          ],
        ),
      ),
    );
  }
}
