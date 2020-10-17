import 'package:brainbatu/models/user.dart';
import 'package:brainbatu/services/authService.dart';
import 'package:brainbatu/services/userModel.dart';
import "package:flutter/material.dart";

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username;
  String _password;
  bool _isLoggingin = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff0064FF),
      body: SafeArea(
        child: SingleChildScrollView(
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
                            'Login ',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _username = value;
                            });
                          },
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return '* Value is required';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Username',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            fillColor: Color(0x52A2CBFE),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            errorStyle: TextStyle(color: Colors.white),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintStyle: TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty) {
                              return '* Value is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                            errorStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            filled: true,
                            fillColor: Color(0x52A2CBFE),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: screenWidth,
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              _isLoggingin ? 'Loginig in' : 'Login',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Poppins'),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                AuthProvider authProvider = AuthProvider();
                                final Future<Map<String, dynamic>>
                                    successfulMessage =
                                    authProvider.login(_username, _password);
                                successfulMessage.then((response) {
                                  if (response['status']) {
                                    User user = response['user'];
                                    Provider.of<UserProvider>(context)
                                        .setUser(user);
                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  } else {
                                    print(response['message']);
                                  }
                                });
                              }
                            },
                            color: Color(0xff0CB058),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'forgot password',
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Poppins"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
