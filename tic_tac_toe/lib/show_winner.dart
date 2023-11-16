import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board_cell.dart';
import 'package:tic_tac_toe/styling/styled_button.dart';
import 'package:tic_tac_toe/styling/styled_text.dart';

class ShowWinner {
  void showWinnerDialog(BuildContext context, String? winner) {
    final colorScheme = Theme.of(context).colorScheme;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              width: 5.0,
            ),
          ),
          title: Center(
            child: StyledText(
              text: (winner != null)
                  ? 'Game over! ${winner.toUpperCase()} won!'
                  : 'Game over! Draw!',
              borderWidth: 4,
              fontSize: 20,
              textColor: colorScheme.inversePrimary,
              shadow: BoardCell.shadow,
            ),
          ),
          actions: [
            Center(
              child: StyledButton(
                overlayColor: colorScheme.inversePrimary,
                onPressButton: () {
                  Navigator.pop(context);
                },
                borderWidthButton: 2.0,
                child: StyledText(
                  borderWidth: 3.0,
                  text: 'OK',
                  fontSize: 15.0,
                  textColor: colorScheme.inversePrimary,
                  shadow: BoardCell.shadow,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
