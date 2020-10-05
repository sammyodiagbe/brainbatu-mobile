import "package:flutter/material.dart";

class AccountOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text('Your account overview'),
          Container(
            height: 150,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Balance', style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text(
                  '\$1000',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff0CB058),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  child: Text(
                    'Deposit',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                  color: Color(0xff0CB058),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(width: 20),
                FlatButton(
                  child: Text('withdraw'),
                  onPressed: () {},
                  color: Color(0xffefefef),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'transaction history',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
              height: 300,
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'Withdrawal',
                    ),
                    trailing: Text('\$50'),
                  ),
                  ListTile(
                    title: Text('Withdrawal'),
                    trailing: Text(
                      '\$50',
                      style: TextStyle(color: Color(0xfff8556a)),
                    ),
                  ),
                  ListTile(
                    title: Text('Withdrawal'),
                    trailing: Text('\$50'),
                  ),
                  ListTile(
                    title: Text('Withdrawal'),
                    trailing: Text(
                      '\$50',
                      style: TextStyle(color: Color(0xfff8556a)),
                    ),
                  ),
                  ListTile(
                    title: Text('Withdrawal'),
                    trailing: Text('\$50'),
                  ),
                  ListTile(
                    title: Text('Deposit'),
                    trailing: Text(
                      '\$50',
                      style: TextStyle(color: Color(0xff0CB058)),
                    ),
                  ),
                  ListTile(
                    title: Text('Withdrawal'),
                    trailing: Text('\$50'),
                  ),
                  ListTile(
                    title: Text('Withdrawal'),
                    trailing: Text('\$50'),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
