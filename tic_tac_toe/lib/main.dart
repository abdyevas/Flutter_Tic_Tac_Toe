import 'package:flutter/material.dart';
import 'package:tic_tac_toe/my_game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 124, 65, 176)),
        useMaterial3: true,
      ),
      home: const MyGameScreen(),
    );
  }
}