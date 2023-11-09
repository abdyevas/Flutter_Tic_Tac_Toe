import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board_cell.dart';
import 'package:tic_tac_toe/styling/styled_button.dart';

class MyGameScreen extends StatefulWidget {
  const MyGameScreen({super.key});

  @override
  State<MyGameScreen> createState() => _MyGameScreen();
}

class _MyGameScreen extends State<MyGameScreen> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'x';
  bool gameOver = false;
  bool isDraw = false;
  List<int> winningButtons = [];

  final List<List<int>> winningPositions = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
    [0, 4, 8], [2, 4, 6] // Diagonals
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 200,
        ),
        Center(
          child: SizedBox(
            width: 350,
            height: 450,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return BoardCell(
                  index: index,
                  board: board,
                  gameOver: gameOver,
                  isDraw: isDraw,
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
                      } else if (board.every((cell) => cell.isNotEmpty)) {
                        gameOver = true;
                        isDraw = true;
                      }

                      if (!gameOver) {
                        currentPlayer = (currentPlayer == 'x') ? 'o' : 'x';
                      }
                    }
                    setState(() {});
                  },
                  winningButtons: winningButtons,
                );
              },
            ),
          ),
        ),
        StyledButton(
          radius: 50.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.refresh,
                size: 40.0,
                color: colorScheme.inverseSurface,
              ),
            ],
          ),
        ),
      ],
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
