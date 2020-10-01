import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AuthService {
  final String endpoint = 'http://192.168.43.50:9000/graphql';
  Future<dynamic> login(String username, String password) async {
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
            }
          }
        '''
          },
        ),
      );
      if (backendCall.statusCode == 200) {
        var decodedJson = jsonDecode(backendCall.body);
        return decodedJson;
      }
      return null;
    } catch (err) {
      print(err);
    }
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

      if (backendCall.statusCode == 200) {
        print('yay');
        var decodedJson = jsonDecode(backendCall.body);
        return decodedJson;
      } else {
        return jsonDecode(backendCall.body);
      }
    } catch (err) {
      print(err.toString());
    }
    return null;
  }
}
