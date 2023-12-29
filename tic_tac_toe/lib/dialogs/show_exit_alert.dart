import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/board_cell.dart';
import 'package:tic_tac_toe/styling/styled_button.dart';
import 'package:tic_tac_toe/styling/styled_text.dart';

class ShowExitAlert {
  void showExitDialog(
    BuildContext context,
    final void Function() onHome,
  ) {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StyledText(
                  text: 'You sure?',
                  textColor: colorScheme.inversePrimary,
                  borderWidth: 4,
                  fontSize: 20,
                  shadow: BoardCell.shadow,
                ),
                StyledText(
                  text: 'Game state will be lost...',
                  textColor: colorScheme.inversePrimary,
                  borderWidth: 4,
                  fontSize: 20,
                  shadow: BoardCell.shadow,
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StyledButton(
                    onPressButton: () {
                      onHome();
                      Navigator.pop(context);
                    },
                    borderWidthButton: 2.0,
                    overlayColor: colorScheme.inversePrimary,
                    child: StyledText(
                        borderWidth: 3.0,
                        text: 'Yes',
                        textColor: colorScheme.inversePrimary,
                        shadow: BoardCell.shadow),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  StyledButton(
                    onPressButton: () {
                      Navigator.pop(context);
                    },
                    borderWidthButton: 2.0,
                    overlayColor: colorScheme.inversePrimary,
                    child: StyledText(
                        borderWidth: 3.0,
                        text: 'No',
                        textColor: colorScheme.inversePrimary,
                        shadow: BoardCell.shadow),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
