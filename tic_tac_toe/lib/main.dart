import 'package:flutter/material.dart';
import 'package:tic_tac_toe/my_game_screen.dart';
import 'package:tic_tac_toe/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 135, 103, 163)),
        useMaterial3: true,
      ),
      home: const Scaffold(
        backgroundColor: Color.fromARGB(255, 100, 53, 142),
        body:  StartScreen(),
      ),
    );
  }
}