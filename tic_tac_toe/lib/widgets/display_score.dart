import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board_cell.dart';
import 'package:tic_tac_toe/styling/styled_text.dart';

class DisplayScore extends StatelessWidget {
  final int playerXScore;
  final int playerOScore;

  const DisplayScore({super.key, required this.playerXScore, required this.playerOScore});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          StyledText(
            text: 'Player  X  :  $playerXScore',
            textColor: colorScheme.inversePrimary,
            shadow: BoardCell.shadow,
            fontSize: 25.0,
            borderWidth: 7.0,
          ),
          const SizedBox(
            height: 5,
          ),
          StyledText(
            text: 'Player  O  :  $playerOScore',
            textColor: colorScheme.inversePrimary,
            shadow: BoardCell.shadow,
            fontSize: 25.0,
            borderWidth: 7.0,
          ),
        ],
      ),
    );
  }
}
