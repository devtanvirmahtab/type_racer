import 'package:type_racer/utils/socket_client.dart';

class SocketMethod {
  final _socketClient = SocketClient.instance.socket!;

  //create game
  createGame(String nickName) {
    if (nickName.isNotEmpty) {
      _socketClient.emit('create-game', {'nickName': nickName});
    }
  }
}
