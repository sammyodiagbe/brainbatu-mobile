import 'package:brainbatu/services/socketServices.dart';
import "package:socket_io_client/socket_io_client.dart" as IO;

class SocketManager {
  IO.Socket socket;

  // initialize and connect the socket
  initializeUserSocket(String username) {
    socket = IO.io(SocketService.peerSocketUri, <String, dynamic>{
      'forceNew': true,
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

  initializePeerSocket() {
    // print('initializing peer socket');
    // var namespace = IO.io('${SocketService.peerSocketUri}/peer2peer');
    // namespace.on('connect', (data) {
    //   print(namespace);
    //   print('connected');
    //   namespace.emit('hello');
    // });
    socket.emit('join-p2p');
  }

  joinGame(String liveRoomId) {
    String liveRoomID = 'liveroom:$liveRoomId:users';
    socket.emit('join-room', liveRoomID);
  }

  initializeSocketListener(IO.Socket socket) {}
}
