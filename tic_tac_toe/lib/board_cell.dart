import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styling/styled_button.dart';
import 'package:tic_tac_toe/styling/styled_text.dart';

class BoardCell extends StatelessWidget {
  const BoardCell({
    super.key,
    required this.index,
    required this.board,
    required this.gameOver,
    required this.isDraw,
    required this.onPressCell,
    required this.winningButtons,
  });

  final int index;
  final List<String> board;
  final bool gameOver;
  final bool isDraw;
  final VoidCallback onPressCell;
  final List<int> winningButtons;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    bool isWinningButton = winningButtons.contains(index);
    final bool isEnabled = !isWinningButton;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: (gameOver && isEnabled)
              ? StyledButton(
                  radius: 10.0,
                  overlayColor: Colors.transparent,
                  padding: 0.0,
                  onPressButton: null,
                  child: Transform.translate(
                    offset: const Offset(0, -5),
                    child: Center(
                      child: StyledText(
                          text: board[index],
                          borderWidth: 5.0,
                          fontSize: 70,
                          textColor: colorScheme.inverseSurface,
                          shadow: null),
                    ),
                  ),
                )
              : StyledButton(
                  radius: 10.0,
                  overlayColor: colorScheme.inversePrimary,
                  padding: 0.0,
                  onPressButton: onPressCell,
                  child: Transform.translate(
                    offset: const Offset(0, -5),
                    child: Center(
                      child: StyledText(
                        text: board[index],
                        borderWidth: 10.0,
                        fontSize: 70,
                        textColor: colorScheme.inversePrimary,
                        shadow: <Shadow>[
                          Shadow(
                            offset: const Offset(10.0, 10.0),
                            blurRadius: 10.0,
                            color: colorScheme.inverseSurface,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}