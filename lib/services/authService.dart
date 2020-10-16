import 'dart:async';
import 'dart:convert';
import 'package:brainbatu/models/user.dart';
import 'package:brainbatu/services/prefs.dart';
import 'package:http/http.dart';
import "package:brainbatu/services/appUrl.dart";
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  Loggedout
}

class AuthProvider {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeringStatus = Status.NotRegistered;
  String username;

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

        result = {'status': true, 'message': 'Successful', 'user': user};
      } else {
        _loggedInStatus = Status.NotLoggedIn;

        result = {
          'status': false,
          'message': json.decode(response.body)['message']
        };
      }
    } else {
      _loggedInStatus = Status.NotLoggedIn;

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

  Future<Map<String, dynamic>> verifyAuthUser() async {
    var result;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    Map<String, dynamic> data = {'token': token};
    if (token == null) {
      result = {"status": false};
    } else {
      Response response = await post(AppUrl.verify,
          body: json.encode(data),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);
        if (responseData['successful']) {
          User user = User.fromJson(responseData['user']);
          result = {"status": true, "user": user};
        } else {
          result = {"status": false};
          sharedPreferences.remove('token');
        }
      } else {
        result = {"status": false};
      }
    }
    return result;
  }
}
