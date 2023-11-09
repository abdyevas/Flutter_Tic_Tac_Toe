import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 135, 103, 163)),
        useMaterial3: true,
      ),
      home: const Game(),
    );
  }
}
