import 'package:brainbatu/models/user.dart';
import 'package:brainbatu/screens/partials/appbar.dart';
import 'package:brainbatu/services/userModel.dart';
import 'package:brainbatu/socket/peerBatuSocketManager.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class ActivePeersScreen extends StatefulWidget {
  @override
  _ActivePeersScreenState createState() => _ActivePeersScreenState();
}

class _ActivePeersScreenState extends State<ActivePeersScreen> {
  @override
  void initState() {
    User user = Provider.of<UserProvider>(context, listen: false).user;
    Provider.of<PeerSocketManager>(context, listen: false)
        .initializePeerSocket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: Text('hellow'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10),
            child: Text('Active peers'),
          ),
          Container(
              height: 600,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  10,
                  (index) {
                    return Card(
                      color: Colors.white,
                      elevation: 0,
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
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff0CB058),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text('Username'))
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
