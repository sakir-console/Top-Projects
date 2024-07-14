/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
//Login check
  static Future<bool> loggedUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }



}
