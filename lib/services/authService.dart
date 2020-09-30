import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AuthService {
  static Future<void> login(String username, String password) async {
    try {
      var backendCall = await http.post(
        'http://192.168.43.50:9000/graphql',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'query': '''
          mutation {
            login(userData: {username: "$username", password: "$password"} )  {
              token
            }
          }
        '''
        }),
      );
      if (backendCall.statusCode == 200) {
      } else {
        print('Something went wrong');
      }
    } catch (err) {
      print(err);
    }
  }
}
