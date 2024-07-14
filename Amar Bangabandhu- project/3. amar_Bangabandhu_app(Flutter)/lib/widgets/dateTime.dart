/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/


import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class HomePagex extends StatefulWidget {
  @override
  _HomePagexState createState() => _HomePagexState();
}

class _HomePagexState extends State<HomePagex> {
  var selectedTD;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datetime Picker'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1970, 1, 1),
                      maxTime: DateTime(2022, 6, 7),
                      theme: DatePickerTheme(
                          headerColor: Colors.teal[300],
                          backgroundColor: Colors.blue[50],
                          itemStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    //print('confirm $date');

                    setState(() {
                      print(date.toString().split(" ")[0]);
                      selectedTD = date.toString().split(" ")[0].split("-");
                      //selectedTD = date.toString().split("-");
                      print(selectedTD[1]);
                      print(selectedTD[0]);
                      print(selectedTD[2]);
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.bn);
                },
                child: Text(
                  'show date picker(custom theme &date time range)',
                  style: TextStyle(color: Colors.blue),
                )),
          ],
        ),
      ),
    );
  }
}
