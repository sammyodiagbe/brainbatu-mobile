import "package:flutter/material.dart";

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          'Brainbatu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Text(
                'Bal: \$500',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff0CB058),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color(0xffefefef),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('10'),
                Text('Question 2 of 5'),
              ],
            ),
          ),
          Text(
            'Root it has but no ones sess, tall taller that trees, up it goes but still it never grows ?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    child: Text('Option a'),
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffefefef),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    child: Text('Option b'),
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffefefef),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      'Option c',
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff0CB058),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    child: Text('Option d'),
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffefefef),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 30),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xff0CB058),
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
