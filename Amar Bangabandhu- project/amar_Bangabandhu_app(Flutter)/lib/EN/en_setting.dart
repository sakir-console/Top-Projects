/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/




import 'package:amar_bangabandhu/EN/en_home.dart';
import 'package:amar_bangabandhu/screens/home.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'en_developers.dart';
import 'en_registration.dart';

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
        msg: "Logout successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => EnRegistrationScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
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
                userName: "Profile",
                userProfilePic: AssetImage("assets/icons/govt.png"),
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    withBackground: true,
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "Profile",
                  subtitle: "Tap to update your profile",
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
                settingsGroupTitle: "Language",
                items: [
                  SettingsItem(
                    onTap: () {
                      SelectLanguage('bn');
                      Fluttertoast.showToast(
                          msg: "বাংলায় প্রদর্শিত হচ্ছে",
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
                      backgroundColor: Colors.green,
                    ),
                    title: 'বাংলা',
                    subtitle: "গেম এর ডিফল্ট ভাষা বাংলা করুন",
                    trailing: Text(''),
                  ),
                  SettingsItem(
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "English already selected",
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
                      backgroundColor: Colors.red,
                    ),
                    title: 'English',
                    subtitle: "English as default game language",
                    trailing: Text(''),
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: "Account",
                items: [
                  SettingsItem(
                    onTap: () {
                      logOut(context);
                    },
                    icons: Icons.exit_to_app_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                    ),
                    title: 'Log out',
                    subtitle: "Logout from account",
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
                              builder: (context) => EnDevelopers()));
                    },
                    icons: Icons.build,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.teal,
                    ),
                    title: 'Developers',
                    subtitle: "Developers panel",
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
