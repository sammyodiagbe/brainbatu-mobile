import 'package:brainbatu/screens/auth/login.dart';
import 'package:brainbatu/screens/auth/signup.dart';
import "package:flutter/material.dart";

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    final screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0064FF),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screenWidth,
              width: screenHeight,
              padding: EdgeInsets.all(8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                          ),
                          elevation: 3.0,
                          padding: EdgeInsets.all(20),
                          color: Color(0xff0CB058),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()),
                            );
                          },
                          child: Text(
                            'signup',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          elevation: 3.0,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 40)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
