import 'package:brainbatu/models/user.dart';
import 'package:brainbatu/screens/main/home.dart';
import 'package:brainbatu/screens/other/landingScreen.dart';
import "package:flutter/material.dart";

class AuthState extends StatelessWidget {
  final User user;

  AuthState({this.user});

  @override
  Widget build(BuildContext context) {
    return user == null ? LandingScreen() : Home();
  }
}
