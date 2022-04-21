

import 'package:shared_preferences/shared_preferences.dart';

class PrefManager{

  static Future clearPrefManager() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }


  //Token
  static setToken(var token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static   Future<String?>getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? "";
  }
}
