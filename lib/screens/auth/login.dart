import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff0064FF),
      body: Builder(
        builder: (context) => SafeArea(
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
                            'Login',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Value is required';
                            }
                            return null;
                          },
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
                                )),
                            focusedBorder: InputBorder.none,
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintStyle: TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Value is required';
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
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1),
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
                              'Login',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Poppins'),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Valid form'),
                                  ),
                                );
                              } else {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Invaid data'),
                                  ),
                                );
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
