import 'package:flutter/material.dart';
import 'package:tic_tac_toe/my_game_screen.dart';
import 'package:tic_tac_toe/start_screen.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Game();
  }
}

class _Game extends State<Game> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen: startGame);
    super.initState();
  }

  void startGame(bool isOnePlayer) {
    setState(() {
      activeScreen = MyGameScreen(
        onRefresh: () => restartGame(isOnePlayer),
        onHome: returnHomeScreen,
        isOnePlayer: isOnePlayer,
      );
    });
  }

  void restartGame(bool isOnePlayer) {
    setState(() {
      activeScreen = MyGameScreen(
        onRefresh: () => restartGame(isOnePlayer),
        onHome: returnHomeScreen,
        isOnePlayer: isOnePlayer,
      );
    });
  }

  void returnHomeScreen() {
    setState(() {
      activeScreen = StartScreen(switchScreen: startGame);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 100, 53, 142),
      body: Container(
        child: activeScreen,
      ),
    );
  }
}
