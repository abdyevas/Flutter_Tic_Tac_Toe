import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styling/styled_button.dart';
import 'package:tic_tac_toe/styling/styled_text.dart';

class BoardCell extends StatelessWidget {
  static final List<Shadow> shadow = <Shadow>[
    const Shadow(
      offset: Offset(10.0, 10.0),
      blurRadius: 10.0,
      color: Color.fromARGB(255, 51, 32, 58),
    ),
  ];
  
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
                  padding: 0.0,
                  onPressButton: null,
                  child: Transform.translate(
                    offset: const Offset(0, -5),
                    child: Center(
                      child: StyledText(
                          text: board[index],
                          textColor: colorScheme.inverseSurface,
                          shadow: null),
                    ),
                  ),
                )
              : StyledButton(
                  overlayColor: colorScheme.inversePrimary,
                  padding: 0.0,
                  onPressButton: onPressCell,
                  child: Transform.translate(
                    offset: const Offset(0, -5),
                    child: Center(
                      child: StyledText(
                        text: board[index],
                        textColor: colorScheme.inversePrimary,
                        shadow: shadow,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
