import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AuthService {
  static void login(String username, String password) async {
    var backendCall = await http.post(
      'http://192.',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'query': '''
          mutation {
            login(userData: {usernmae: "$username", password: "$password"} )
          }
        '''
      }),
    );
  }
}
