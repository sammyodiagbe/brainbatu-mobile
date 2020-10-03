import 'package:brainbatu/screens/other/authState.dart';
import 'package:brainbatu/services/authService.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String token = sharedPreferences.getString('token');
  runApp(ChangeNotifierProvider<AuthService>(
    child: MaterialApp(
      title: 'brainbatu',
      theme: ThemeData(
        primaryColor: Color(0xffffffff),
        fontFamily: 'Poppins',
        accentColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthState(token),
    ),
    create: (context) => AuthService(),
  ));
}
