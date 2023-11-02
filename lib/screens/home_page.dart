import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Cerate/join a room to play',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    onTap: () => Navigator.pushNamed(context, '/create-room'),
                    text: "Create",
                    isHome: true,
                  ),
                  CustomButton(
                    onTap: () => Navigator.pushNamed(context, '/join-room'),
                    text: "Join",
                    isHome: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
