/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

Future postApi(String endPoint, Map<String, dynamic> body,
    {bool header}) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    Map<String, String> headers;
    if (token != null) {
      headers = {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',

      };
    } else {
      headers = {};
    }
    var res = await http.post(Uri.parse(API.HOST + API.Version + endPoint),
        body: body, headers: headers);
    print(API.HOST + API.Version + endPoint);
    var jsonResponse = json.decode(res.body.toString());
    print("POST Response: ${jsonResponse.toString()}");
    return await jsonResponse;
}

Future getApi(String endPoint, {bool header}) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    Map<String, String> headers;
    if (token != null) {
      headers = {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json;charset=UTF-8",
        "Charset": "utf-8"
      };
    } else {
      headers = {};
    }
    var res = await http.get(Uri.parse(API.HOST + API.Version + endPoint),
        headers: headers);
    print(API.HOST +API.Version+ endPoint);
    var jsonResponse = json.decode(res.body);
    print("GET Response: $jsonResponse");
    return await jsonResponse;

}





Future performanceRequest(String endPoint, Map<String, dynamic> body,
    {bool header}) async {

  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString('token');
  Map<String, String> headers;
  if (token != null) {
    headers = {      "Content-Type" : "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',

    };
  } else {
    headers = {};
  }
  var res = await http.post(Uri.parse(API.HOST + API.Version + endPoint),
      body: json.encode(body), headers: headers);
  print(API.HOST + API.Version + endPoint);
  var jsonResponse = jsonDecode(res.body);
  print("POST Response: $jsonResponse");
  return await jsonResponse;
}

