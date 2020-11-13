import 'package:brainbatu/services/socketServices.dart';
import "package:socket_io_client/socket_io_client.dart";

class SocketManager {
  Socket socket;

  // initialize and connect the socket
  initializeUserSocket(String username) {
    socket = io(SocketService.socketServerUri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    // on socket connection
    socket.on("connect", (data) {
      print('we are connected straight up');
      initializeSocketListener(socket);
    });

//  when the socket gets disconnected
    socket.on('disconnect', (data) {
      print('User has lost connection');
    });
    // socket = ;
    // socket.on(SocketEvents.connect.toString(), (data) {
    //   print('connected');
    //   print(data);
    // });
  }

  joinGame(String liveRoomId) {
    String liveRoomID = 'liveroom:$liveRoomId:users';
    socket.emit('join-room', liveRoomID);
  }

  initializeSocketListener(Socket socket) {}
}
