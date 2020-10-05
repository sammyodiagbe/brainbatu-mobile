import "package:flutter/material.dart";

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffefefef),
                    radius: 100,
                  ),
                  Positioned(
                    right: 10,
                    top: 30,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Mathew kingsman',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Text(
              '60XP',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('Batus'), Text('100')],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('Won'), Text('100')],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('lost'), Text('100')],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                elevation: 1,
                child: Text(
                  'Challenge',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff0CB058),
                padding: EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ));
  }
}
