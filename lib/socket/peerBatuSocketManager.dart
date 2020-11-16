import 'dart:async';

import 'package:brainbatu/models/user.dart';
import 'package:brainbatu/services/socketServices.dart';
import 'package:socket_io_client/socket_io_client.dart';

class PeerSocketManager {
  Socket socket;
  String userSocketId;
  StreamController<Map<String, dynamic>> activeUsersController;
  get activeUsers => activeUsersController.stream;

  initializePeerSocket(User user) {
    activeUsersController = StreamController<Map<String, dynamic>>.broadcast();
    socket = io(SocketService.peerSocketUri, <String, dynamic>{
      'forceNew': true,
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.on('connect', (data) {
      socket.emit('user-connected',
          {'username': user.username, 'avatar_url': user.avatarUrl});
    });

    socket.on('setup', (data) {
      print('connected');
      print(data);
      // socket.emit('hello');
    });

    socket.on('active-users', (data) {
      activeUsersController.add(data['active_users']);
    });
  }

  initializeListener() {
    print('connected');
    socket.emit('hello');
    // socket.on('setup', (data) {
    //   print('connected');
    //   print(data);
    // });
  }

  void setUserUp(data) {
    print('setting things up');
    print(data);
  }

  void dispose() {
    activeUsersController.close();
    socket.close();
  }
}
