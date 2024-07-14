/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/




import 'package:flutter/material.dart';

class EnRules extends StatefulWidget {
  @override
  _EnRulesState createState() => _EnRulesState();
}

class _EnRulesState extends State<EnRules> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rules',
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Game Rules',
              style: TextStyle(
                //  fontFamily: 'Kongka',
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
            children: [
              Text(
                "1. At first complete the registration by filling out the registration form.\n\n"

                    "2. Then there will be four menu options from the menu interface. Press the play now button from there.\n\n"

                    "3. The app was designed with a total of 29 steps according to the order of the year in the context of various events in the life of Father of the Nation Bangabandhu Sheikh Mujibur Rahman.\n\n"



                    "4. Thus, a section consists of six steps and the last section consists of five steps.\n\n"

                    "5. If each section is successfully completed, there is a Q&A session based on the information displayed in the steps of that section. The contestant has to go to the next step after completing the Q&A session.\n\n"

                    "6. The results will be determined based on the correct answer to the Q&A session, the time, and the puzzle-solving time of each step. The contestant will be able to view his results and position by providing the appropriate information on the designated website. \n\n"

                    "7. Competitors up to 10 years, 10-18 years and above will be able to participate in three categories namely Junior, Youth and Senior respectively.\n\n"

                    "8. Internet connection must be confirmed before participating in the competition.\n\n"
                    "9. No competitor's information will be stored and displayed in the database without an internet connection.\n\n"
                    "10. A contestant can participate in the contest as many times as he wishes, in which case the latest information will be displayed in the database.\n\n"
                    "11. The contestant must update the profile information by logging in by providing the appropriate information on the designated website. Incomplete profiles will not be considered for the award.\n\n\n"


                    "N:B: The Ministry of Liberation War Affairs and the Bangladesh National Cadet Corps may at any time change, extend, modify and amend any rules of the competition.\n\n"
                ,
                style: TextStyle(
                   // letterSpacing: 5,
                   // fontFamily: 'Kongka',
                    fontSize: 19.4,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black54),
              )
            ],
          ),
        ),
      ),
    );
  }
}
