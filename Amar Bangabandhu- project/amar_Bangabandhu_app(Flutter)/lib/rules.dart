/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/




import 'package:flutter/material.dart';

class Rules extends StatefulWidget {
  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'গেম সম্পর্কিত নিয়মাবলি',
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('গেম সম্পর্কিত নিয়মাবলি',
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
                    colors: <Color>[Colors.red, Colors.blue])),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Colors.white10,
                Colors.blueAccent,
              ])),
          child: ListView(
            children: const [
              Text(
             "১. সর্বপ্রথম নিবন্ধন ফর্ম পুরন করে নিবন্ধন সম্পন্ন করুন।\n"
          "২. অতঃপর মেনু ইন্টারফেস হতে চারটি মেনু অপশন আসবে। সেখান থেকে শুরু করুন বাটনে চাপ দিন।\n "
          "৩. জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের জীবনে বিভিন্ন ঘটনার প্রেক্ষিতে বছরের ক্রম অনুযায়ী সর্বমোট ২৯টি ধাপ এর সমন্বয়ে অ্যাপটি ডিজাইন করা হয়।\n "

          "৪. এইভাবে ছয়টি ধাপ মিলে একটি বিভাগ এবং সর্বশেষ বিভাগ পাঁচটি ধাপের সমন্বয়ে গঠিত।\n"
         "৫. প্রতিটি বিভাগ সফলভাবে শেষ করা হলে উক্ত বিভাগের ধাপসমুহে প্রদর্শিত তথ্যের ভিত্তিতে প্রশ্নোত্তর পর্ব রয়েছে। প্রতিযোগীকে প্রশ্নোত্তর পর্ব সমাপ্ত করে পরবর্তী ধাপে যেতে হবে। \n"
          "৬. প্রশ্নোত্তর পর্বের সঠিক উত্তর, সময় এবং প্রতিটি ধাপের পাজল সমাধান সময়ের উপর ভিত্তি করে ফলাফল নির্ধারিত হবে। প্রতিযোগী তার ফলাফল ও অবস্থান, নির্ধারিত ওয়েবসাইটে যথাযথ তথ্য প্রদান করে দেখে নিতে পারবেন।\n"
         " ৭. জুনিয়র, ইয়ুথ ও সিনিয়র নামে মোট তিনটি বিভাগে যথাক্রমে ১০ বছর পর্যন্ত, ১০-১৮ বছর এবং ১৮ এর তদূর্ধ্ব প্রতিযোগীরা অংশগ্রহণ করতে পারবে।\n"
         "৮. প্রতিযোগিতায় অংশগ্রহণের পূর্বে ইন্টারনেট সংযোগ নিশ্চিত করতে হবে।\n\n"
         "৯. ইন্টারনেট সংযোগ ব্যাতিত কোন প্রতিযোগীর তথ্য ডাটাবেসে সংরক্ষিত ও প্রদর্শিত হবে না।\n\n"
         "১০. একজন প্রতিযোগী যতবার ইচ্ছা ততবার প্রতিযোগিতায় অংশগ্রহন করতে পারবে, সেক্ষেত্রে সর্বশেষ তথ্য ডাটাবেসে প্রদর্শিত হবে।\n\n"
         "১১. প্রতিযোগীকে অবশ্যই নির্ধারিত ওয়েবসাইটে যথাযথ তথ্য প্রদান করে লগইন করে প্রোফাইল এর তথ্য হালনাগাদ করতে হবে। অসম্পূর্ণ তথ্য সমৃদ্ধ প্রোফাইল পুরষ্কারের জন্য বিবেচিত হবে না।\n\n"

          "বিঃদ্রঃ  মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয় ও বাংলাদশ ন্যাশনাল ক্যাডেট কোর যে কোন সময় প্রতিযোগিতার যে কোন নিয়ম পরিবর্তন, পরিবর্ধন, পরিমার্জন এবং সংশোধন করতে পারে।",
                style: TextStyle(
                    letterSpacing: 5,
                    fontFamily: 'Kongka',
                    fontSize: 19.4,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              )
            ],
          ),
        ),
      ),
    );
  }
}
