import "package:flutter/material.dart";

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _textStyle = TextStyle(fontSize: 18);
    final _iconColor = Color(0xff888888);
    final double _iconSize = 30;
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 180,
            color: Color(0xff0CB058),
            margin: EdgeInsets.only(bottom: 20),
          ),
          InkWell(
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
              print('hello');
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
