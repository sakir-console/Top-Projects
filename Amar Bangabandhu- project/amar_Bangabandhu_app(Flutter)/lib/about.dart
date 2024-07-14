/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/


import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final List<Map> _users = [
    {
      'id':
          'জনাব আ.ক.ম. মোজাম্মেল হক\nমাননীয় মন্ত্রী, মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয়',
      'name': 'John',
      'icon': '1.jpeg'
    },
    {
      'id': 'জনাব খাজা মিয়া\nসচিব, মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয়',
      'name': 'Bob',
      'icon': '2.jpeg'
    },
    {
      'id':
          'রঞ্জিত কুমার দাস\nঅতিরিক্ত সচিব (প্রশাসন), মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয়',
      'name': 'Trump',
      'icon': '3.jpeg'
    },
    {
      'id': 'ব্রিঃ জেঃ নাহিদুল ইসলাম খান, বিএসপি,এনডিসি,পিএসসি\nমহাপরিচালক, বিএনসিসি',
      'name': 'Joe Biden',
      'icon': '4.jpeg'
    },
    {
      'id': 'লেঃ কর্নেল রাহাত নেওয়াজ, পিএসসি\nরেজিমেন্ট কমান্ডার, রমনা রেজিমেন্ট\nপরিকল্পনায়, আমার বঙ্গবন্ধু অ্যাপ',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id': 'মেজর মোঃ শফিকুর রহমান\nঅ্যাকাউন্টস অফিসার, বিএনসিসি ',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id': 'মেজর সোমেন কান্তি বড়ুয়া\nরেজিমেন্ট এ্যাডজুটেন্ট, রমনা রেজিমেন্ট',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id': 'মেজর আব্দুস সামাদ\nব্যাটালিয়ন এ্যাডজুটেন্ট, রমনা রেজিমেন্ট',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id': 'মেজর এস এম বদরুল হায়দার শামীম, পিএসসি\nব্যাটালিয়ন এ্যাডজুটেন্ট, রমনা রেজিমেন্ট',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id':
          'পিইউও ইঞ্জিঃ মোঃ জহিরুল ইসলাম\nকোম্পানি কমান্ডার, সি কোম্পানি\nপ্লাটুন কমান্ডার, ড্যাফোডিল ইন্টারন্যাশনাল ইউনিভার্সিটি বিএনসিসি প্লাটুন\nঅ্যাপ ডিজাইন, আমার বঙ্গবন্ধু অ্যাপ',
      'name': 'Wonder Lady',
      'icon': '6.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'গেম সম্পর্কিত',
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('গেম সম্পর্কিত',
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
                    colors: <Color>[Colors.blue, Colors.purple])),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.white10, Colors.deepPurple])),
          child: ListView(
            children: [
              const Text("ভূমিকা",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 4,
                      fontFamily: 'Kongka',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              Text(
                "হাজার বছরের শ্রেষ্ঠ বাঙ্গালি, স্বাধীন বাংলার স্থপতি, বাংলাদেশের স্বাধীনতা সংগ্রামের রূপকার বঙ্গবন্ধু শেখ মুজিবুর রহমান। পরাধীনতার শিকলে বন্দি, নির্যাতিত-নিপীড়িত এবং আত্মপরিচয়হীন এক জাতিকে তিনি স্বপ্ন দেখান নিজস্ব জাতিস্বত্তা পরিচয়ে এক স্বাধীন ভূখণ্ডের। তাঁর প্রজ্ঞা ও দূরদর্শী নেতৃত্বে সুদীর্ঘ ২৪ বছরের আন্দোলন-সংগ্রামের মধ্য দিয়ে বাঙ্গালি জাতি তাই খুঁজে পায় তার আত্মপরিচয়ের ঠিকানা স্বাধীন সার্বভৌম বাংলাদেশ। তাই মুজিব মানেই বাংলাদেশের প্রতিধ্বনি। এ কারনে এই মহামানবের প্রতি শ্রদ্ধা নিবেদন এর পাশাপাশি আমাদের প্রিয় মাতৃভূমি বাংলাদেশের উন্নয়নের জন্য ও তার দেশপ্রেম, আদর্শ ও নেতৃত্বের গুলাবলী বক্ষে ধারন একান্তই আবশ্যক। সে জন্য প্রতিটি বাঙ্গালির বঙ্গবন্ধুর বর্ণাঢ্য জীবনী জানা আবশ্যক। অন্যথায় বঙ্গবন্ধুর আদর্শে দীক্ষিত তাঁর সুযোগ্য কন্যা মাননীয় প্রধানমন্ত্রী শেখ হাসিনার নেতৃত্বে আমরা আজ যে উন্নতির মহীসোপানে, তা থেকে ভবিষ্যতে পথ হারাতে পারে বাংলাদেশ। প্রজন্ম থেকে প্রজন্মান্তরে জাতির পিতার অবিনাশী চেতনা ও আদর্শ ছড়িয়ে দেয়ার জন্য যুগোপযোগী পদক্ষেপ গ্রহনের মাধ্যমে ডিজিটাল প্লাটফর্মে বর্তমান প্রজন্মসহ দেশে বিদেশে প্রতিটি মানুষকে জাতির পিতার সম্পর্কে জানানোর লক্ষ্যে বাংলাদেশ ন্যাশনাল ক্যাডেট কোর (বিএনসিসি) কর্তৃক বাংলা এবং ইংরেজিতে তৈরী করা হয়েছে অ্যাপ ভিত্তিক গেম 'আমার বঙ্গবন্ধু' । গেমটি সবার নিকট ছড়িয়ে দেবার জন্যে গণপ্রজাতন্ত্রী বাংলাদেশ সরকারের মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয় সার্বিক সহযোগিতা প্রদান করে।",
                style: TextStyle(
                    letterSpacing: 4,
                    fontFamily: 'Kongka',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const Text("লক্ষ্য ও উদ্দেশ্য",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 4,
                      fontFamily: 'Kongka',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              Text(
                "আমার বঙ্গবন্ধু অ্যাপ এর মাধ্যমে দেশে-বিদেশে সকল বয়সের মানুষের নিকট বঙ্গবন্ধুর জীবনী ডিজিটাল প্লাটফর্মে সহজভাবে তুলে ধরার চেষ্টা করা হয়েছে।",
                style: TextStyle(
                    letterSpacing: 4,
                    fontFamily: 'Kongka',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                "এই গেমিং অ্যাপটি ব্যবহারে বঙ্গবন্ধুর দেশপ্রেম, আদর্শ, এবং নেতৃত্বের গুনাবলীতে বলীয়ান হবার পাশাপাশি আত্মবিশ্বাসী একটি জাতি গঠন করা সম্ভব হবে বলে আমরা মনে করি।",
                style: TextStyle(
                    letterSpacing: 4,
                    fontFamily: 'Kongka',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                "\nযাদের ঐকান্তিক প্রচেষ্টায় অ্যাপ ভিত্তিক গেম 'আমার বঙ্গবন্ধু' বাস্তবতায় রূপ নেয়ঃ\n",
                style: TextStyle(
                    letterSpacing: 4,
                    fontFamily: 'Kongka',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              Table(

                children: _users.map((user) {
                  return TableRow(children: [
                    Container(
                        padding: const EdgeInsets.all(17),
                        child: Text(
                          user['id'].toString(),
                          style: TextStyle(
                            fontFamily: 'Kongka',
                            fontWeight: FontWeight.bold,
                          ),
                        )),

                  ]);
                }).toList(),
                border: TableBorder.all(width: 1, color: Colors.black),
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "সাকায়েত সাকির (ডেভেলপার)",
                    style: TextStyle(
                      fontFamily: 'Kongka',
                      fontWeight: FontWeight.bold,
                        color:Colors.black54,
                        fontSize: 18
                    ),
                  )),

              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "তানজীম খান নকিব (ডেভেলপার)",
                    style: TextStyle(
                      fontFamily: 'Kongka',
                      fontWeight: FontWeight.bold,
                        color:Colors.black54,
                        fontSize: 18
                    ),
                  )),

              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "সিইউও লিথু জামান",
                    style: TextStyle(
                      fontFamily: 'Kongka',
                      fontWeight: FontWeight.bold,
                      color:Colors.black54,
                      fontSize: 18
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "সিইউও সাখাওয়াত হোসেন",
                    style: TextStyle(
                      fontFamily: 'Kongka',
                      fontWeight: FontWeight.bold,
                      color:Colors.black54,
                      fontSize: 18
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "ক্যাডেট সার্জেন্ট সাব্বির আহম্মেদ",
                    style: TextStyle(
                      fontFamily: 'Kongka',
                      fontWeight: FontWeight.bold,
                      color:Colors.black54,
                      fontSize: 18
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "সিইউও রাইসুল আরেফিন ইয়ামিন ",
                    style: TextStyle(
                      fontFamily: 'Kongka',
                      fontWeight: FontWeight.bold,
                      color:Colors.black54,
                      fontSize: 18
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "ক্যাডেট সার্জেন্ট আব্দুর রব ",
                    style: TextStyle(
                      fontFamily: 'Kongka',
                      fontWeight: FontWeight.bold,
                      color:Colors.black54,
                      fontSize: 18
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "ক্যাডেট সার্জেন্ট আজমাইন নেওয়াজ  ",
                    style: TextStyle(
                      fontFamily: 'Kongka',
                      fontWeight: FontWeight.bold,
                      color:Colors.black54,
                      fontSize: 18
                    ),
                  )),

              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "ক্যাডেট কর্পো. তানজিদ ইসলাম তানিম ",
                    style: TextStyle(
                      fontFamily: 'Kongka',
                      fontWeight: FontWeight.bold,
                      color:Colors.black54,
                      fontSize: 18
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "ক্যাডেট কর্পো. সানজানা সেলিম বর্ষা (কন্ঠ সহযোগী)",
                    style: TextStyle(
                        fontFamily: 'Kongka',
                        fontWeight: FontWeight.bold,
                        color:Colors.black54,
                        fontSize: 18
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "সিইউও সোমা চৌধুরি (কন্ঠ সহযোগী)",
                    style: TextStyle(
                        fontFamily: 'Kongka',
                        fontWeight: FontWeight.bold,
                        color:Colors.black54,
                        fontSize: 18
                    ),
                  )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 42.0),
                child: Text(
                  'উৎসর্গঃ শহীদ শাফী ইমাম রুমী',
                  style: TextStyle(fontSize: 22, fontFamily: 'Kongka',color: Colors.black54),
                ),
              )),    Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 42.0),
                child: Text(
                  'Developed By: বাংলাদেশ ন্যাশনাল ক্যাডেট কোর।',
                  style: TextStyle(fontSize: 16),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Version : 1.0.7',
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
