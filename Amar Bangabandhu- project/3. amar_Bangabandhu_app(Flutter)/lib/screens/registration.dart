/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'dart:math';

import 'package:amar_bangabandhu/utils/helpers/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amar_bangabandhu/main.dart';
import 'package:amar_bangabandhu/screens/signIn.dart';
import 'package:amar_bangabandhu/widgets/SignInputBox.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'backgrounds/registration_bg.dart';
import 'home.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  ProgressDialog pr;

  String _chosenClass;
  var selectedTD;
  TextEditingController nameController = TextEditingController();
  TextEditingController bcnidController = TextEditingController();
  TextEditingController disController = TextEditingController();
  TextEditingController genController = TextEditingController();
  TextEditingController gpController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController refController = TextEditingController();

  Future signUp() async {
    await pr.show();
    var data = await postApi("signup", {
      "name": "${nameController.text}",
      "bc_nid": "${bcnidController.text}",
      "phone": "${phnController.text}",
      "password": "${passController.text}",
      "dob": "${birthController.text}",
      "location": "${selectedDis.id}",
      "gender": "${selectGen.id}",
      "gdn_pfn": "${selectedGP.id}",
      "ref": "${refController.text}",
    });

    if (data['result'] == true) {
      await pr.hide();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', data['data']['token']);
      preferences.setString('grp', data['data']['grp']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false);
      Fluttertoast.showToast(
          msg: data['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      await pr.hide();
      Fluttertoast.showToast(
          msg: data['data'].toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  Districts selectedDis;
  GrdnProf selectedGP;
  Gender selectGen;
  List<Districts> districts = <Districts>[
    const Districts(null, 'Select District', 'আপনার জেলা নির্বাচন করুন'),
    const Districts(1, 'Dhaka', 'ঢাকা'),
    const Districts(2, 'Chattogram', 'চট্টগ্রাম'),
    const Districts(3, 'Rajshahi', 'রাজশাহী'),
    const Districts(4, 'Khulna', 'খুলনা'),
    const Districts(5, 'Barisal', 'বরিশাল'),
    const Districts(6, 'Sylhet', 'সিলেট'),
    const Districts(7, 'Mymensingh', 'ময়মনসিংহ'),
    const Districts(8, 'Gazipur', 'গাজীপুর'),
    const Districts(9, 'Gopalganj', 'গোপালগঞ্জ'),
    const Districts(10, 'Kishoreganj', 'কিশোরগঞ্জ'),
    const Districts(11, 'Faridpur', 'ফরিদপুর'),
    const Districts(12, 'Manikganj', 'মানিকগঞ্জ'),
    const Districts(13, 'Munshiganj', 'মুন্সিগঞ্জ'),
    const Districts(14, 'Rajbari', 'রাজবাড়ী'),
    const Districts(15, 'Brahmanbaria', 'ব্রাহ্মণবাড়িয়া'),
    const Districts(16, 'Comilla', 'কুমিল্লা'),
    const Districts(17, 'Feni', 'ফেনী'),
    const Districts(18, 'Rangamati', 'রাঙ্গামাটি'),
    const Districts(19, 'Noakhali', 'নোয়াখালী'),
    const Districts(20, 'Chandpur', 'চাঁদপুর'),
    const Districts(21, 'Lakshmipur', 'লক্ষ্মীপুর'),
    const Districts(22, 'Coxsbazar', 'কক্সবাজার'),
    const Districts(23, 'Khagrachhari', 'খাগড়াছড়ি'),
    const Districts(24, 'Bandarban', 'বান্দরবান'),
    const Districts(25, 'Sirajganj', 'সিরাজগঞ্জ'),
    const Districts(26, 'Pabna', 'পাবনা'),
    const Districts(27, 'Bogura', 'বগুড়া'),
    const Districts(28, 'Natore', 'নাটোর'),
    const Districts(29, 'Joypurhat', 'জয়পুরহাট'),
    const Districts(30, 'Chapainawabganj', 'চাঁপাইনবাবগঞ্জ'),
    const Districts(31, 'Naogaon', 'নওগাঁ'),
    const Districts(32, 'Jashore', 'যশোর'),
    const Districts(33, 'Satkhira', 'সাতক্ষীরা'),
    const Districts(34, 'Meherpur', 'মেহেরপুর'),
    const Districts(35, 'Narail', 'নড়াইল'),
    const Districts(36, 'Chuadanga', 'চুয়াডাঙ্গা'),
    const Districts(37, 'Kushtia', 'কুষ্টিয়া'),
    const Districts(38, 'Magura', 'মাগুরা'),
    const Districts(39, 'Bagerhat', 'বাগেরহাট'),
    const Districts(40, 'Jhenaidah', 'ঝিনাইদহ'),
    const Districts(41, 'Jhalakathi', 'ঝালকাঠি'),
    const Districts(42, 'Patuakhali', 'পটুয়াখালী'),
    const Districts(43, 'Pirojpur', 'পিরোজপুর'),
    const Districts(44, 'Bhola', 'ভোলা'),
    const Districts(45, 'Barguna', 'বরগুনা'),
    const Districts(46, 'Moulvibazar', 'মৌলভীবাজার'),
    const Districts(47, 'Habiganj', 'হবিগঞ্জ'),
    const Districts(48, 'Sunamganj', 'সুনামগঞ্জ'),
    const Districts(49, 'Narsingdi', 'নরসিংদী'),
    const Districts(50, 'Shariatpur', 'শরীয়তপুর'),
    const Districts(51, 'Narayanganj', 'নারায়ণগঞ্জ'),
    const Districts(52, 'Tangail', 'টাঙ্গাইল'),
    const Districts(53, 'Madaripur', 'মাদারীপুর'),
    const Districts(54, 'Panchagarh', 'পঞ্চগড়'),
    const Districts(55, 'Dinajpur', 'দিনাজপুর'),
    const Districts(56, 'Lalmonirhat', 'লালমনিরহাট'),
    const Districts(57, 'Nilphamari', 'নীলফামারী'),
    const Districts(58, 'Gaibandha', 'গাইবান্ধা'),
    const Districts(59, 'Thakurgaon', 'ঠাকুরগাঁও'),
    const Districts(60, 'Rangpur', 'রংপুর'),
    const Districts(61, 'Kurigram', 'কুড়িগ্রাম'),
    const Districts(62, 'Sherpur', 'শেরপুর'),
    const Districts(63, 'Jamalpur', 'জামালপুর'),
    const Districts(64, 'Netrokona', 'নেত্রকোণা'),
  ];
  List<Gender> genders = <Gender>[
    const Gender(null, 'Select Gender', 'লিঙ্গ নির্বাচন করুন'),
    const Gender(1, 'Male', 'পুরুষ'),
    const Gender(2, 'Female', 'মহিলা'),
    const Gender(3, 'Custom', 'অন্যান্য'),
  ];

  List<GrdnProf> grdnProfs = <GrdnProf>[
    const GrdnProf(
        null, 'Select Gurdians profession', 'নিজের/অবিভাবকের কর্মক্ষেত্র'),
    const GrdnProf(1, 'Army', 'সেনাবাহিনী'),
    const GrdnProf(2, 'Navy', 'নৌবাহিনী'),
    const GrdnProf(3, 'Air Force', 'বিমানবাহিনী'),
    const GrdnProf(4, 'BGB', 'বিজিবি'),
    const GrdnProf(5, 'RAB', 'র‍্যাব'),
    const GrdnProf(6, 'Police', 'পুলিশ'),
    const GrdnProf(7, 'Government employee', 'সরকারি চাকুরিজীবী '),
    const GrdnProf(8, 'Private employee', 'বেসরকারি চাকুরিজীবী'),
    const GrdnProf(9, 'Health service', 'স্বাস্থ্যসেবা'),
    const GrdnProf(10, 'Engineer', 'প্রকৌশল'),
    const GrdnProf(11, 'Teaching', 'শিক্ষকতা'),
    const GrdnProf(12, 'Others', 'অন্যান্য'),
  ];

  @override
  void initState() {
    super.initState();

    selectedDis = districts[0];
    selectedGP = grdnProfs[0];
    selectGen = genders[0];
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      textDirection: TextDirection.ltr,
      isDismissible: true,
      /*    customBody: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
       backgroundColor: Colors.white,
     ),*/
    );

    pr.style(
//      message: 'Downloading file...',
      message: 'অপেক্ষা করুন.. ',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInExpo,
      progress: 0.0,
      textAlign: TextAlign.center,
      progressWidgetAlignment: Alignment.center,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    return Scaffold(
      body: RegistrationBG(
        child: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/aw.png',
                      colorBlendMode: BlendMode.colorBurn,
                      fit: BoxFit.contain,
                      height: 65,
                      width: 100,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/govt.png',
                          height: 48,
                        ),
                        Text(
                          'মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয়',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 10, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/bncc.png',
                          height: 40,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'বিএনসিসি',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 10, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/m100.png',
                      colorBlendMode: BlendMode.colorBurn,
                      height: 62,
                      width: 62,
                    ),
                  ],
                ),
              ),
              Text(
                "নিবন্ধন করুন",
                style: TextStyle(fontFamily: "Kongka", fontSize: 26),
              ),
              SizedBox(height: 5),
              SignInputBox(
                controller: nameController,
                inputIcon: Icons.person_outline,
                hintText: 'আপনার নাম লিখুন',
              ),
              SizedBox(height: 22),
              SignInputBox(
                controller: bcnidController,
                inputIcon: FontAwesomeIcons.idCard,
                hintText: 'জন্মসনদ/ জাতীয় পরিচয় পত্র নম্বর লিখুন',
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  'আপনার পুরষ্কার নিশ্চিত করতে অবশ্যই সঠিক জন্ম/পরিচয়পত্র নম্বর লিখুন(ইংরেজিতে)',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "SolaimanLipi",
                      fontSize: 10),
                ),
              ),
              SizedBox(height: 22),
              SignInputBox(
                controller: phnController,
                inputIcon: FontAwesomeIcons.phone,
                hintText: 'মোবাইল নম্বর',
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 18),
                child: Text(
                  'যোগাযোগ ও অটিপি কোড সংক্রান্ত কারণে মোবাইল নম্বর সঠিক ভাবে লিখুন',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "SolaimanLipi",
                      fontSize: 10),
                ),
              ),
              SizedBox(height: 22),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                width: MediaQuery.of(context).size.width * 0.98,
                child: DropdownButtonFormField<Districts>(
                  elevation: 0,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    prefixIcon: Icon(
                      FontAwesomeIcons.searchLocation,
                      color: Colors.teal,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    hintStyle: const TextStyle(
                        color: Colors.red,
                        fontFamily: "SolaimanLipi",
                        fontSize: 18),
                    filled: true,
                    fillColor: Colors.white38,
                  ),
                  isExpanded: true,
                  focusColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  value: selectedDis,
                  onChanged: (Districts newValue) {
                    setState(() {
                      selectedDis = newValue;
                      print("Dis: ${selectedDis.bn_name}");
                    });
                  },
                  items: districts.map((Districts districts) {
                    return new DropdownMenuItem<Districts>(
                      value: districts,
                      child: new Text(
                        districts.bn_name,
                        style: new TextStyle(
                            color: Colors.indigo,
                            fontFamily: "SolaimanLipi",
                            fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 22),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                width: MediaQuery.of(context).size.width * 0.98,
                child: DropdownButtonFormField<Gender>(
                  elevation: 0,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    prefixIcon: Icon(
                      FontAwesomeIcons.male,
                      color: Colors.teal,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    hintStyle: const TextStyle(
                        color: Colors.red,
                        fontFamily: "SolaimanLipi",
                        fontSize: 18),
                    filled: true,
                    fillColor: Colors.white38,
                  ),
                  isExpanded: true,
                  focusColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  value: selectGen,
                  onChanged: (Gender newValue) {
                    setState(() {
                      selectGen = newValue;
                      print("Gen: $selectGen");
                    });
                  },
                  items: genders.map((Gender gndrs) {
                    return DropdownMenuItem<Gender>(
                      value: gndrs,
                      child: Text(
                        gndrs.bn_name,
                        style: TextStyle(
                            color: Colors.indigo,
                            fontFamily: "SolaimanLipi",
                            fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 22),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                width: MediaQuery.of(context).size.width * 0.98,
                child: DropdownButtonFormField<GrdnProf>(
                  elevation: 0,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    prefixIcon: Icon(
                      FontAwesomeIcons.building,
                      color: Colors.teal,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    hintStyle: const TextStyle(
                        color: Colors.red,
                        fontFamily: "SolaimanLipi",
                        fontSize: 18),
                    filled: true,
                    fillColor: Colors.white38,
                  ),
                  isExpanded: true,
                  focusColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  value: selectedGP,
                  onChanged: (GrdnProf newValue) {
                    setState(() {
                      selectedGP = newValue;
                      print("GP: $selectedGP");
                    });
                  },
                  items: grdnProfs.map((GrdnProf gdnprf) {
                    return DropdownMenuItem<GrdnProf>(
                      value: gdnprf,
                      child: Text(
                        gdnprf.bn_name,
                        style: const TextStyle(
                            color: Colors.indigo,
                            fontFamily: "SolaimanLipi",
                            fontSize: 18),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 22),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                width: MediaQuery.of(context).size.width * 0.98,
                child: TextFormField(
                  readOnly: true,
                  controller: birthController,
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1920, 1, 1),
                        maxTime: DateTime(2019, 1, 1),
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
                        var dob = date.toString().split(" ")[0];
                        birthController = TextEditingController(
                            text: date.toString().split(" ")[0]);

                        selectedTD = date.toString().split(" ")[0].split("-");
                        //selectedTD = date.toString().split("-");
                        print(selectedTD[1]);
                        print(selectedTD[0]);
                        print(selectedTD[2]);
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.bn);
                  },
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      prefixIcon: Icon(
                        FontAwesomeIcons.birthdayCake,
                        color: Colors.teal,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(width: 2, color: Colors.cyan),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.red,
                          fontFamily: "SolaimanLipi",
                          fontSize: 19),
                      filled: true,
                      fillColor: Colors.white38,
                      hintText: 'জন্মসাল এবং তারিখ নির্বাচন করুন'),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 6, right: 10),
                child: Text(
                  'উপযুক্ত বিভাগে( জুনিয়র, ইয়ুথ, সিনিয়র) অংশগ্রহণ করতে সঠিক জন্মসাল নির্বাচন করুন',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "SolaimanLipi",
                      fontSize: 10),
                ),
              ),
              SizedBox(height: 22),
              SignInputBox(
                controller: passController,
                inputIcon: FontAwesomeIcons.key,
                hintText: 'একটি পিন নম্বর দিন',
              ),
              SizedBox(height: 5),
              Text(
                'পরবর্তীতে প্রবেশের জন্য পিন নম্বরটি অবশ্যই সংরক্ষণ করুন',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "SolaimanLipi",
                    fontSize: 10),
              ),
              SizedBox(height: 22),
              SignInputBox(
                controller: refController,
                inputIcon: FontAwesomeIcons.shareSquare,
                hintText: 'রেফারেন্স (অপশনাল)',
              ),
              SizedBox(height: 5),
              Text(
                'যে/যার মাধ্যমে এ্যাপটি সম্পর্কে জেনেছেন তার নাম লিখুন',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "SolaimanLipi",
                    fontSize: 10),
              ),
              SizedBox(height: 16),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    signUp();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        'নিবন্ধন সম্পূর্ণ করুন',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SolaimanLipi",
                            fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 22),
              OutlineGradientButton(
                child: Text(
                  'ইতিমধ্যে নিবন্ধিত',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SolaimanLipi",
                      fontSize: 19),
                ),
                gradient: LinearGradient(
                    colors: [Colors.lightBlue, Colors.tealAccent]),
                strokeWidth: 2,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                radius: Radius.circular(28),
                //corners: Corners(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                backgroundColor: Colors.grey,
                elevation: 4,
                inkWell: true,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                onDoubleTap: () => null,
                onLongPress: () => null,
              ),
              SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}

class Districts {
  const Districts(this.id, this.en_name, this.bn_name);

  // ignore: non_constant_identifier_names
  final String bn_name;
  // ignore: non_constant_identifier_names
  final String en_name;
  final int id;
}

class GrdnProf {
  const GrdnProf(this.id, this.en_name, this.bn_name);

  // ignore: non_constant_identifier_names
  final String bn_name;
  // ignore: non_constant_identifier_names
  final String en_name;
  final int id;
}

class Gender {
  const Gender(this.id, this.en_name, this.bn_name);

  // ignore: non_constant_identifier_names
  final String bn_name;
  // ignore: non_constant_identifier_names
  final String en_name;
  final int id;
}
