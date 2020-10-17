import 'package:brainbatu/screens/auth/login.dart';
import 'package:brainbatu/screens/auth/signup.dart';
import 'package:brainbatu/screens/main/home.dart';
import 'package:brainbatu/screens/other/authState.dart';
import 'package:brainbatu/services/authService.dart';
import 'package:brainbatu/services/userModel.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthProvider authProvider = AuthProvider();
  Map<String, dynamic> checkAuth = await authProvider.verifyAuthUser();
  runApp(BrainBatu(appState: checkAuth));
}

class BrainBatu extends StatelessWidget {
  final Map<String, dynamic> appState;
  BrainBatu({this.appState});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'brainbatu',
        theme: ThemeData(
          primaryColor: Color(0xffffffff),
          fontFamily: 'PTSans',
        ),
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          if (appState['user'] != null) {
            Provider.of<UserProvider>(context).setUser(appState['user']);
          }
          return AuthState(user: appState['user']);
        }),
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => SignupScreen(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}
