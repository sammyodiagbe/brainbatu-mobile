import 'package:brainbatu/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "dart:async";

class Prefs {
  static Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  static void setToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
  }

  static void saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('username', user.username);
    sharedPreferences.setString('email', user.email);
  }
}
