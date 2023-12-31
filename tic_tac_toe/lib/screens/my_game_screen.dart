import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/board_cell.dart';
import 'package:tic_tac_toe/dialogs/show_exit_alert.dart';
import 'package:tic_tac_toe/dialogs/show_winner.dart';
import 'package:tic_tac_toe/styling/styled_button.dart';
import 'package:tic_tac_toe/widgets/display_score.dart';

class MyGameScreen extends StatefulWidget {
  const MyGameScreen({
    super.key,
    required this.onRefresh,
    required this.onHome,
    required this.isOnePlayer,
  });

  final void Function() onRefresh;
  final void Function() onHome;
  final bool isOnePlayer;

  @override
  State<MyGameScreen> createState() => _MyGameScreen();
}

class _MyGameScreen extends State<MyGameScreen> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'x';
  bool gameOver = false;
  bool isDraw = false;
  List<int> winningButtons = [];
  int playerXScore = 0;
  int playerOScore = 0;

  final List<List<int>> winningPositions = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
    [0, 4, 8], [2, 4, 6] // Diagonals
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final ShowExitAlert showExitAlert = ShowExitAlert();
    ShowWinner showWinner = ShowWinner(
      onRefresh: () {
        widget.onRefresh();
        setState(() {
          currentPlayer = 'x';
          gameOver = false;
          isDraw = false;
          winningButtons.clear();
          board = List.filled(9, '');
        });
      },
      onDismiss: () {},
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 150),
        DisplayScore(playerXScore: playerXScore, playerOScore: playerOScore),
        const SizedBox(height: 20),
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
                  onPressCell: (!gameOver)
                      ? () {
                          if (board[index].isEmpty) {
                            board[index] = currentPlayer;
                            makeMove(currentPlayer, showWinner);
                            if (!gameOver) {
                              if (widget.isOnePlayer && currentPlayer == 'x') {
                                int randomIndex = _getRandomIndex();
                                board[randomIndex] = 'o';
                                makeMove('o', showWinner);
                                currentPlayer = 'x';
                              } else {
                                currentPlayer =
                                    (currentPlayer == 'x') ? 'o' : 'x';
                              }
                            }
                          }
                          setState(() {});
                        }
                      : () {},
                  winningButtons: winningButtons,
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledButton(
              radius: 50.0,
              overlayColor: colorScheme.inversePrimary,
              onPressButton: () {
                widget.onRefresh();
                setState(() {
                  currentPlayer = 'x';
                  gameOver = false;
                  isDraw = false;
                  winningButtons.clear();
                  board = List.filled(9, '');
                });
              },
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
            const SizedBox(
              width: 20,
            ),
            StyledButton(
              radius: 50.0,
              overlayColor: colorScheme.inversePrimary,
              onPressButton: (board.every((cell) =>
                      cell.isEmpty && playerOScore == 0 && playerXScore == 0))
                  ? widget.onHome
                  : () {
                      showExitAlert.showExitDialog(context, widget.onHome);
                    },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home_outlined,
                    size: 40.0,
                    color: colorScheme.inverseSurface,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  int _getRandomIndex() {
    List<int> emptyIndeces = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        emptyIndeces.add(i);
      }
    }

    if (emptyIndeces.isNotEmpty) {
      int randomI = Random().nextInt(emptyIndeces.length);
      return emptyIndeces[randomI];
    } else {
      return -1;
    }
  }

  bool isWinner(String player) {
    for (List<int> positions in winningPositions) {
      if (positions.every((index) => board[index] == player)) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    playerXScore = 0;
    playerOScore = 0;
  }

  void updateScore(String winner) {
    if (winner == 'x') {
      playerXScore++;
    } else if (winner == 'o') {
      playerOScore++;
    }
  }

  void makeMove(String currentPlayer, ShowWinner showWinner) {
    if (isWinner(currentPlayer)) {
      gameOver = true;
      winningButtons.addAll(
        winningPositions.singleWhere(
          (positions) =>
              positions.every((index) => board[index] == currentPlayer),
          orElse: () => [],
        ),
      );
      showWinner.showWinnerDialog(context, currentPlayer);
      updateScore(currentPlayer);
    } else if (board.every((cell) => cell.isNotEmpty)) {
      gameOver = true;
      isDraw = true;
      showWinner.showWinnerDialog(context, null);
    }
  }
}
