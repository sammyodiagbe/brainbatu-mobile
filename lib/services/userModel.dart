import 'package:brainbatu/models/user.dart';
import 'package:brainbatu/services/socketServices.dart';
import 'package:flutter/foundation.dart';
import "package:socket_io_client/socket_io_client.dart";

enum SocketEvents { connect, disconnect }

class UserProvider extends ChangeNotifier {
  User _user;

  User get user => _user;
  setUser(User user) {
    _user = user;
    // notifyListeners();
    initializeUserSocket(user.username);
  }

  initializeUserSocket(String username) {
    Socket socket = io(SocketService.socketServerUri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.on("connect", (data) {
      initializeSocketListener(socket);
    });
    // socket = ;
    // socket.on(SocketEvents.connect.toString(), (data) {
    //   print('connected');
    //   print(data);
    // });
  }

  initializeSocketListener(Socket socket) {}
}
