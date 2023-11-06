import 'package:flutter/material.dart';
// import 'package:type_racer/utils/socket_client.dart';
// import 'package:type_racer/utils/socket_method.dart';
import 'package:type_racer/widgets/custom_button.dart';
import 'package:type_racer/widgets/custom_text_field.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  // final SocketMethod _socketMethod = SocketMethod();

  // final TextEditingController _nameController = TextEditingController();
  late final IO.Socket socket;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    socket = IO.io(
      'http://192.168.0.104:3000',
      {
        'transports': ['websocket'],
        'force new connection': true,
      },
    );

    socket.connect();

    socket.emit(
      "test",
      {"connect": "OK"},
    );

    // IO.Socket? socket;

    // socket = IO.io(
    //     'http://192.168.0.104:3000',
    //     IO.OptionBuilder()
    //         .setTransports(['websocket']) // for Flutter or Dart VM
    //         .disableAutoConnect() // disable auto-connection
    //         .setExtraHeaders({'foo': 'bar'}) // optional
    //         .build());
    // socket.connect();

    // socket.emit('test', "this is working from the create room");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Create Room",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: "Enter your Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "Create",
                  onTap: () {
                    print("create ");
                    socket.emit(
                      "test",
                      "socket test is working ",
                    );
                  },

                  // () =>_socketMethod.createGame(_nameController.text.toString()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
