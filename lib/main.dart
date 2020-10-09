import 'package:brainbatu/screens/auth/login.dart';
import 'package:brainbatu/screens/auth/signup.dart';
import 'package:brainbatu/screens/main/home.dart';
import 'package:brainbatu/screens/other/authState.dart';
import 'package:brainbatu/services/authService.dart';
import 'package:brainbatu/services/userModel.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BrainBatu());
}

class BrainBatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(create: (context) => UserProvider())
      ],
      child: MaterialApp(
        title: 'brainbatu',
        theme: ThemeData(
          primaryColor: Color(0xffffffff),
          fontFamily: 'PTSans',
        ),
        debugShowCheckedModeBanner: false,
        home: AuthState(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => SignupScreen(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}
