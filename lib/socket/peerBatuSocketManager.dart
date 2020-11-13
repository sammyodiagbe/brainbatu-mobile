import 'package:brainbatu/services/socketServices.dart';
import 'package:socket_io_client/socket_io_client.dart';

class PeerSocketManager {
  Socket socket;

  initializePeerSocket() {
    socket = io(SocketService.socketServerUri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.on('connect', initializeListener(socket));
  }

  initializeListener(Socket socket) {
    print(socket);
  }
}
