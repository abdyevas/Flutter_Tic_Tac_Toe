import 'package:flutter/material.dart';
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
            shadow: <Shadow>[
              Shadow(
                offset: const Offset(10.0, 10.0),
                blurRadius: 10.0,
                color: colorScheme.inverseSurface,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          StyledButton(
            radius: 20.0,
            overlayColor: colorScheme.inversePrimary,
            padding: 16.0,
            onPressButton: switchScreen,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 40.0,
                  color: colorScheme.inverseSurface,
                ),
                const Text(
                  ' Start ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
