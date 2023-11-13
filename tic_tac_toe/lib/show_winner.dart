import 'package:flutter/material.dart';
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
          title: StyledText(
            text: (winner != null)
                ? 'Game over! Winner $winner!'
                : 'Game over! Draw!',
            borderWidth: 3,
            fontSize: 20,
            textColor: colorScheme.inversePrimary,
            shadow: <Shadow>[
              Shadow(
                offset: const Offset(10.0, 10.0),
                blurRadius: 10.0,
                color: colorScheme.inverseSurface,
              ),
            ],
          ),
          actions: [
            Center(
              child: StyledButton(
                radius: 10.0,
                overlayColor: colorScheme.inversePrimary,
                padding: 15.0,
                onPressButton: () {
                  Navigator.pop(context);
                },
                child: StyledText(
                  text: 'OK',
                  borderWidth: 3,
                  fontSize: 15,
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
          ],
        );
      },
    );
  }
}
