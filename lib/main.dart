import 'package:flutter/material.dart';
import 'package:type_racer/screens/create_room_screen.dart';

import 'screens/home_page.dart';
import 'screens/join_room_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/create-room' : (context) => const CreateRoomScreen(),
        '/join-room' : (context) => const JoinRoomScreen(),
      },
    );
  }
}

