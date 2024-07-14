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
import 'package:google_fonts/google_fonts.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

class EnDevelopers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Developers panel',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text("Developer's panel", style: GoogleFonts.ubuntu()),
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
                    bottomCardHeight: 135,
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
                  'Engr Md Zahirul Islam',
                  style: GoogleFonts.gugi(fontSize: 18),
                ),
                Text(
                  'Mentor',
                  style: GoogleFonts.gugi(fontSize: 16, color: Colors.black54),
                ),
                Text(
                  'Amar Bangabandhu App',
                  style: GoogleFonts.gugi(fontSize: 16, color: Colors.black54),
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
            Text(
              'Assistant Professor, \nDaffodil International University',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SolaimanLipi',
                  fontSize: 18),
            ),
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
                  text: 'Facebook   ',
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
                  'Sakaid Sakir',
                  style: GoogleFonts.gugi(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Developer',
                  style: GoogleFonts.gugi(fontSize: 18, color: Colors.black45),
                ),
                Text(
                  'Amar Bangabandhu App',
                  style:
                      GoogleFonts.gugi(fontSize: 16, color: Colors.cyan[600]),
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
            Text(
              'Chittagong University of Engineering & Technology - CUET',
              style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.white),
            ),
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
                  text: 'Facebook   ',
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
                  'Tanjim Khan Nokib',
                  style: GoogleFonts.gugi(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Developer',
                  style: GoogleFonts.gugi(fontSize: 18, color: Colors.black45),
                ),
                Text(
                  'Amar Bangabandhu App',
                  style:
                      GoogleFonts.gugi(fontSize: 16, color: Colors.cyan[600]),
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
            Text(
              'Daffodil International University',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SolaimanLipi',
                  fontSize: 18),
            ),
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
                  text: 'Facebook   ',
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
