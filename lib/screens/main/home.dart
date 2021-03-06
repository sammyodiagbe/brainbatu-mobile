import 'package:brainbatu/models/user.dart';
import 'package:brainbatu/screens/partials/appbar.dart';
import 'package:brainbatu/screens/partials/drawer.dart';
import 'package:brainbatu/services/userModel.dart';
import 'package:brainbatu/socket/socketManager.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    User user = Provider.of<UserProvider>(context, listen: false).user;
    Provider.of<SocketManager>(context, listen: false)
        .initializeUserSocket(user.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, _) => Scaffold(
        appBar: BaseAppBar(
          title: Text('Home'),
          appBar: AppBar(),
        ),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Live batugrounds ${provider.user.username}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  // live batugrounds
                  Flexible(
                    fit: FlexFit.loose,
                    child: SizedBox(
                      height: 250,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            Container(
                              height: 100,
                              width: 250,
                              color: Colors.white,
                              child: Center(
                                child: RaisedButton(
                                  onPressed: () {
                                    Provider.of<SocketManager>(context,
                                            listen: false)
                                        .joinGame('100');
                                  },
                                  child: Text('Join 100'),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              height: 100,
                              width: 200,
                              color: Colors.white,
                              child: Center(
                                child: Text('hello there'),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              height: 100,
                              width: 200,
                              color: Colors.white,
                              child: Center(
                                child: Text('hello there'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 3,
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Find a batu',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      color: Color(0xff0CB058),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Your favourites',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  // grid list of the user's favourite
                  Flexible(
                    fit: FlexFit.loose,
                    child: SizedBox(
                      height: 200,
                      child: GridView.count(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: List.generate(
                            10,
                            (index) {
                              return Card(
                                color: Colors.white,
                                elevation: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Color(0xffefefef),
                                          radius: 35,
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 15,
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Color(0xff0CB058),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        child: Text('Username'))
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          )),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
