import 'package:brainbatu/screens/other/landingScreen.dart';
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      title: 'brainbatu',
      theme: ThemeData(
        primaryColor: Color(0xff6b88ff),
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    ),
  );
}
