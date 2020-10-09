import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:brainbatu/models/user.dart';
import 'package:brainbatu/services/prefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import "package:brainbatu/services/appUrl.dart";

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  Loggedout
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeringStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredStatus => _registeringStatus;

  // logging the user in
  Future<Map<String, dynamic>> login(String username, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password,
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(AppUrl.login,
        body: json.encode(loginData),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      bool authenticated = responseData['authenticated'];
      if (authenticated) {
        User user = User.fromJson(responseData['user']);
        String token = responseData['token'];
        Prefs.saveUser(user);
        Prefs.setToken(token);
        _loggedInStatus = Status.LoggedIn;
        notifyListeners();

        result = {'status': true, 'message': 'Successful', 'user': user};
      } else {
        _loggedInStatus = Status.NotLoggedIn;
        notifyListeners();
        result = {
          'status': false,
          'message': json.decode(response.body)['message']
        };
      }
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message']
      };
    }
    return result;
  }

  // signing the user up
  Future<Map<String, dynamic>> createAccount(
      String username, String email, String password) async {
    var result;

    final Map<String, dynamic> signupData = {
      'username': username,
      'password': password,
      'email': email
    };

    _registeringStatus = Status.Registering;
    notifyListeners();

    Response response = await post(AppUrl.register,
        body: json.encode(signupData),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      bool successful = responseData['successful'];
      var message = responseData['message'];
      if (successful) {
        _registeringStatus = Status.Registered;
        result = {'status': true, 'message': message};
      } else {
        result = {'status': false, 'message': message};
      }
    }
    return result;
  }
}
