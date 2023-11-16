import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board_cell.dart';
import 'package:tic_tac_toe/styling/styled_button.dart';
import 'package:tic_tac_toe/styling/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.switchScreen});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 15,
          ),
          StyledText(
            text: 'WELCOME TO\n TIC TAC TOE!',
            borderWidth: 10.0,
            fontSize: 35.0,
            textColor: colorScheme.background,
            shadow: BoardCell.shadow,
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 200,
            height: 70,
            child: StyledButton(
              radius: 20.0,
              overlayColor: colorScheme.inversePrimary,
              onPressButton: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person,
                    size: 35.0,
                    color: colorScheme.inverseSurface,
                  ),
                  const Text(
                    '  1 player ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20, 
          ),
          SizedBox(
            width: 200,
            height: 70,
            child: StyledButton(
              radius: 20.0,
              overlayColor: colorScheme.inversePrimary,
              onPressButton: switchScreen,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.group_outlined,
                    size: 40.0,
                    color: colorScheme.inverseSurface,
                  ),
                  const Text(
                    ' 2 players ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
