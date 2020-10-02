import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  bool _authenticated = false;
  bool isLoggingin = false;
  bool isCreatingAccount = false;
  String _loginError = '';
  String _signupError = '';
  bool _accountCreated = false;

  String get loginMessage => _loginError;
  String get signupErrorMessage => _signupError;
  bool get accountCreated => _accountCreated;
  bool get userIsAuthenticated => _authenticated;

  final String endpoint = 'http://192.168.43.50:9000/graphql';
  Future<dynamic> login(String username, String password) async {
    print('logging user in');
    try {
      var backendCall = await http.post(
        endpoint,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            'query': '''
          mutation {
            login(userData: {username: "$username", password: "$password"} )  {
              token
              user {
                _id
                username
                email
                avatarUrl
                wallet
                gameWallet
                verified
              }
            }
          }
        '''
          },
        ),
      );
      print('let us check this');
      var decodedJson = jsonDecode(backendCall.body);
      if (decodedJson['errors'] != null) {
        String _message = decodedJson['errors'][0]['message'];
        _loginError = _message;
        _authenticated = false;
      } else {
        dynamic data = decodedJson['data']['login'];
        String token = data['token'];
        print(token);
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', token);
        _authenticated = true;
        _loginError = null;
      }
      return true;
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<dynamic> signup(String username, String email, String password) async {
    try {
      var backendCall = await http.post(
        endpoint,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            'query': '''
              mutation {
                createAccount(userData: {username: "$username", password: "$password", email: "$email"}) {
                  response
                }
              }
            '''
          },
        ),
      );
      var decodedJson = jsonDecode(backendCall.body);
      print(decodedJson);
      if (decodedJson['errors'] != null) {
        String _message = decodedJson['errors'][0]['message'];
        _signupError = _message;
        _authenticated = false;
        _accountCreated = false;
      } else {
        _accountCreated = true;
      }
    } catch (err) {
      print('error we got --- ${err.toString()}');
    }
    return null;
  }

  Future<String> checkAuth() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token');
      if (token == null) {
        _authenticated = false;
      } else {
        _authenticated = true;
      }
      notifyListeners();
      return 'success';
    } catch (err) {}
    return null;
  }
}
