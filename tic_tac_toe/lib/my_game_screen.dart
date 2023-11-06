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
  bool gameOver = false;
  List<int> winningButtons = [];

  final List<List<int>> winningPositions = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
    [0, 4, 8], [2, 4, 6] // Diagonals
  ];

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
                  gameOver: gameOver,
                  onPressCell: () {
                    if (!gameOver && board[index].isEmpty) {
                      board[index] = currentPlayer;

                      if (isWinner(currentPlayer)) {
                        gameOver = true;
                        winningButtons.addAll(
                          winningPositions.singleWhere(
                            (positions) => positions.every(
                                (index) => board[index] == currentPlayer),
                            orElse: () => [],
                          ),
                        );
                        print("$currentPlayer wins!");
                      } else if (board.every((cell) => cell.isNotEmpty)) {
                        gameOver = true;
                        print('Draw!');
                      }

                      if (!gameOver) {
                        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
                      } else {
                        print(winningButtons);
                      }
                    }
                    setState(() {});
                  },
                  winningButtons: winningButtons,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isWinner(String player) {
    for (List<int> positions in winningPositions) {
      if (positions.every((index) => board[index] == player)) {
        return true;
      }
    }
    return false;
  }
}
