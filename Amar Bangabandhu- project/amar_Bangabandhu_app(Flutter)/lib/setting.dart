/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/




import 'package:amar_bangabandhu/EN/en_home.dart';
import 'package:amar_bangabandhu/screens/developers.dart';
import 'package:amar_bangabandhu/screens/home.dart';
import 'package:amar_bangabandhu/screens/registration.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Future SelectLanguage(String ln) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lang', ln);
    print("Language: $ln");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ln == 'bn' ? HomeScreen() : const EnHomeScreen(),
        ),
        (route) => false);
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    Fluttertoast.showToast(
        msg: "প্রস্থান সফল হয়েছে",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          title: Text("প্রোফাইল & সেটিংস",
              style: TextStyle(
                  fontFamily: 'Kongka',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // User card
              BigUserCard(
                cardColor: Colors.red,
                userName: "প্রোফাইল",
                userProfilePic: AssetImage("assets/icons/govt.png"),
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    withBackground: true,
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "প্রোফাইল আপডেট",
                  subtitle: "প্রোফাইল তথ্য সম্পাদন করুন",
                  onTap: () {
                    FlutterWebBrowser.openWebPage(
                      url: "https://amarbangabandhu.app/player/dashboard",
                      customTabsOptions: const CustomTabsOptions(
                        colorScheme: CustomTabsColorScheme.dark,
                        darkColorSchemeParams: CustomTabsColorSchemeParams(
                          toolbarColor: Colors.redAccent,
                          secondaryToolbarColor: Colors.green,
                          navigationBarColor: Colors.amber,

                          navigationBarDividerColor: Colors.cyan,
                        ),
                        shareState: CustomTabsShareState.off,
                        instantAppsEnabled: true,
                        showTitle: false,
                        urlBarHidingEnabled: true,
                      ),
                    );
                  },
                ),
              ),
              SettingsGroup(
                settingsGroupTitle: "ভাষা",
                items: [
                  SettingsItem(
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "বাংলায় ইতিমধ্যে প্রদর্শিত",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    icons: Icons.done_all,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.green,
                    ),
                    title: 'বাংলা',
                    subtitle: "গেম এর ডিফল্ট ভাষা বাংলা করুন",
                    trailing: Text(''),
                  ),
                  SettingsItem(
                    onTap: () {
                      SelectLanguage('en');
                      Fluttertoast.showToast(
                          msg: "Displaying in English",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.teal,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    icons: Icons.language,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'English',
                    subtitle: "English as default game language",
                    trailing: Text(''),
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: "একাউন্ট",
                items: [
                  SettingsItem(
                    onTap: () { logOut(context);},
                    icons: Icons.exit_to_app_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                    ),
                    title: 'প্রস্থান',
                    subtitle: "প্রস্থান করুন",
                    trailing: Text(''),
                  ),
                ],
              ),
              // You can add a settings title
              SizedBox(
                height: 10,
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Developers()));
                    },
                    icons: Icons.build,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.teal,
                    ),
                    title: 'ডেভেলপারস',
                    subtitle: "ডেভেলপারস প্যানেল",
                    trailing: Text(''),
                  ),
                ],
              ),

              Center(
                child: Text('Version: 1.0.1'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
