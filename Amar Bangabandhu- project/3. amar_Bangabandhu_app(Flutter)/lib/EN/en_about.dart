/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnAbout extends StatefulWidget {
  @override
  _EnAboutState createState() => _EnAboutState();
}

class _EnAboutState extends State<EnAbout> {
  final List<Map> _users = [
    {
      'id':
      'Mr. AKM Mozammel Haque\nHonorable Minister\nMinistry of Liberarion War Affairs (MoLWA)',
      'name': 'John',
      'icon': '1.jpeg'
    },
    {
      'id': 'Mr. Khwaja Mia\nSecretary\nMinistry of Liberarion War Affairs (MoLWA)',
      'name': 'Bob',
      'icon': '2.jpeg'
    },
    {
      'id':
      'Ranjit Kumar Das\nAdditional Secretary (Administration)\nMinistry of Liberarion War Affairs (MoLWA)',
      'name': 'Trump',
      'icon': '3.jpeg'
    },
    {
      'id': 'Brig. Gen. Nahidul Islam Khan, BSP, ndc, psc\nDirector General\nBangladesh National Cadet Corps (BNCC)',
      'name': 'Joe Biden',
      'icon': '4.jpeg'
    },
    {
      'id': 'Lt. Col. Rahat Newaz, psc\nRegiment Commander, Ramna Regiment, BNCC\nPlanning, AMAR BANGABANDHU APP',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id': 'Major Md Shafiqur Rahman\nAccounts Officer, BNCC',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id': 'Major Shomen Kanti Barua\nAdjutant, Ramna Regiment',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id': 'Major Abdus Samad\nBattalion Adjutant, Ramna Regiment',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id': 'Major S M Badrul Hasan Shamim, psc\nBattalion Adjutant, Ramna Regiment',
      'name': 'Superman',
      'icon': '5.jpeg'
    },
    {
      'id':
      'PUO Engr. Md. Zahirul Islam\nCompany Commander, C Company\nPlatoon Commander, Daffodil International University BNCC Platoon\nDesign, AMAR BANGABANDHU APP',
      'name': 'Wonder Lady',
      'icon': '6.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Game',
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('About Game',
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
              const Text("Introduction",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 4,
                      fontFamily: 'Kongka',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              Text(
                "The greatest Bengali of thousand years, Father of the Nation Bangabandhu Sheikh Mujibur Rahman, is the most embodiment of the freedom struggle of Bangladesh and the architect of her independence. He showed the dream of an independent country to a captivated and chained nation that was suppressed, oppressed, and was without self-identity. After long 24 years of struggle under his wise and far-sighted leadership, the Bangalis got independent and sovereign Bangladesh. So Mujib is the mirror of Bangladesh. For this reason, besides paying homage to this great leader, his patriotic ideals and leadership qualities for the development of our beloved motherland Bangladesh must be cherished in our hearts and minds. The nation must know the colorful biography of Bangabandhu. Otherwise, we may lose our path from the highway of development in the future. An Aim to inform everyone at home and abroad, including the present generation about the ideals of the Father of the nation on the digital platform, the Bangladesh National Cadet Corps (BNCC) has created this app-based game ’Amar Bangabandhu’. Ministry of Liberation War Affairs of the Government of Bangladesh is providing overall support to spread the game to all.",
                style: TextStyle(


                    fontSize: 18.0,

                    color: Colors.black54),
              ),
              const Text("Aims and objectives",
                  textAlign: TextAlign.center,
                  style: TextStyle(


                      fontSize: 25.0,

                      color: Colors.black54)),
              Text(
                "To present the biography of Bangabandhu by the digital platform to people of all ages at home and abroad.\n",
                style: TextStyle(


                    fontSize: 18.0,

                    color: Colors.indigo),
              ),
              Text(
                "We think using the ‘Amar Bangabandhu' digital gaming app, a confident nation that is equipped with patriotism, ideals, and leadership qualities of Bangabandhu.",
                style: TextStyle(


                    fontSize: 18.0,

                    color: Colors.blue),
              ),
              Text(
                "\nThrough their dedicated efforts, the app-based game 'Amar Bangabandhu' became a reality\n",
                style: TextStyle(

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
                    "Sakaid Sakir (Developer)",
                    style: GoogleFonts.gugi(
                        color:Colors.black54,
                        fontSize: 18),
                  )),

              Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "Tanjim Khan Nokib (Developer)",
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
                    "CUO Lithu Jaman",
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
                    "CUO SHAKAWAT HOSSAIN",
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
                    "Cadet SGT Sabbir Ahammed Sohag",
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
                    "CUO Raisul Arafin Yeamin  ",
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
                    "Cadet SGT Abdur Rob  ",
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
                    "Cadet CPL Tanjid Islam Tanim   ",
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
                    "Cadet SGT Azmain Newaz ",
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
                    "Cadet Cpl Sunzana Salim Borsha (Voice)",
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
                    "CUO Shoma Chowdhury (Voice) ",
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
                      'Dedicated: Shaheed Shafi Imam Rumi',
                      style: GoogleFonts.aladin(
                          color:Colors.black54,
                          fontSize: 18),
                    ),
                  )),    Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 42.0),
                    child: Text(
                      'Developed By: Bangladesh National Cadet Corps',
                      style: TextStyle(fontSize: 14),
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
