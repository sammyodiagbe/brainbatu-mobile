import "package:flutter/material.dart";

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0064FF),
      body: SafeArea(
        child: Container(
            height: screenHeight,
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Create account',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Poppins",
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          prefixIcon:
                              Icon(Icons.account_circle, color: Colors.white),
                          fillColor: Color(0x52A2CBFE),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins'),
                          focusColor: Color(0xff6b88ff),
                          focusedBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon:
                              Icon(Icons.mail_outline, color: Colors.white),
                          fillColor: Color(0x52A2CBFE),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins'),
                          focusedBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          fillColor: Color(0x52A2CBFE),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins'),
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: screenWidth,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Create account',
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Poppins"),
                          ),
                          onPressed: () {},
                          color: Color(0xff0CB058),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
