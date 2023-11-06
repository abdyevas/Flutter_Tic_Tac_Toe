import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board_cell.dart';

class MyGameScreen extends StatefulWidget {
  const MyGameScreen({super.key});

  @override
  State<MyGameScreen> createState() => _MyGameScreen();
}

class _MyGameScreen extends State<MyGameScreen> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 150,
          ),
          SizedBox(
            height: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return BoardCell(
                  index: index,
                  board: board,
                  onPressCell: () {
                    if (board[index].isEmpty) {
                      setState(() {
                        board[index] = currentPlayer;
                        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
