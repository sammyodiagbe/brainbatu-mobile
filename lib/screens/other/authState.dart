import 'package:brainbatu/screens/main/home.dart';
import 'package:brainbatu/screens/other/landingScreen.dart';
import "package:flutter/material.dart";

class AuthState extends StatefulWidget {
  String token;
  AuthState(this.token);
  @override
  _AuthStateState createState() => _AuthStateState();
}

class _AuthStateState extends State<AuthState> {
  @override
  Widget build(BuildContext context) {
    return widget.token == null ? LandingScreen() : Home();
  }
}
