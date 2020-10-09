import 'package:brainbatu/screens/main/home.dart';
import 'package:brainbatu/screens/other/landingScreen.dart';
import 'package:brainbatu/services/authService.dart';
import "package:flutter/material.dart";

class AuthState extends StatefulWidget {
  @override
  _AuthStateState createState() => _AuthStateState();
}

class _AuthStateState extends State<AuthState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LandingScreen());
  }
}

// FutureBuilder(
//         future: auth.verifyUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: Center(
//                 child: Text('Something broke oo'),
//               ),
//             );
//           } else if (snapshot.hasData) {
//             if (snapshot.data == true) {
//               return Home();
//             } else {
//               return LandingScreen();
//             }
//           }
//           return Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: Text('Oops are you sure you are connected'),
//           );
//         },
//         initialData: null,
//       ),
