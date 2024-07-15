import 'package:type_racer/utils/socket_client.dart';

class SocketMethod {
  final _socketClient = SocketClient.instance.socket!;

  //create game
  createGame(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('create-game', {'nickName': nickname});
    }
  }
}
