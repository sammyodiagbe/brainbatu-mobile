import 'package:brainbatu/models/user.dart';
import 'package:brainbatu/screens/main/activePeers.dart';
import 'package:brainbatu/screens/main/home.dart';
import 'package:brainbatu/screens/main/overview.dart';
import 'package:brainbatu/screens/main/profile.dart';
import 'package:brainbatu/services/userModel.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _textStyle = TextStyle(fontSize: 16);
    final _iconColor = Color(0xff888888);
    final double _iconSize = 30;
    final Color _textColor = Color(0xfff8f8f8);
    final TextStyle _headerTextStyle =
        TextStyle(color: _textColor, fontSize: 20);
    return Drawer(
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: 180,
            color: Color(0xff0CB058),
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffefefef),
                  radius: 40,
                ),
                SizedBox(height: 10),
                Consumer<UserProvider>(builder: (context, provider, _) {
                  return Text(
                    'Hi, ${provider.user.username}',
                    textAlign: TextAlign.center,
                    style: _headerTextStyle,
                  );
                })
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.home, size: _iconSize, color: _iconColor),
                  SizedBox(width: 8),
                  Text('Home', style: _textStyle),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ActivePeersScreen(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.center_focus_strong,
                      size: _iconSize, color: _iconColor),
                  SizedBox(width: 8),
                  Text('Batuground', style: _textStyle),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.account_circle,
                      size: _iconSize, color: _iconColor),
                  SizedBox(width: 8),
                  Text('Profile', style: _textStyle),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.favorite, size: _iconSize, color: _iconColor),
                  SizedBox(width: 8),
                  Text('Favourites', style: _textStyle),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AccountOverview(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.attach_money, size: _iconSize, color: _iconColor),
                  SizedBox(width: 8),
                  Text('Account overview', style: _textStyle),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
