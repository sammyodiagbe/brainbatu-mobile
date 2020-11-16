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
        .initializePeerSocket(user);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Provider.of<PeerSocketManager>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    Provider.of<PeerSocketManager>(context, listen: false).dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: Text('Brainbatu'),
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
            child: StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                            snapshot.data['active_users'][index]['username']),
                        title: Text(
                            snapshot.data['active_users'][index]['socketid']),
                      );
                    },
                    itemCount: snapshot.data['active_users'].length,
                  );
                } else if (snapshot.hasError) {
                  return Text('Something broke');
                }
                return Text('hello');
              },
              stream: Provider.of<PeerSocketManager>(context).activeUsers,
            ),
          ),
        ],
      ),
    );
  }
}
