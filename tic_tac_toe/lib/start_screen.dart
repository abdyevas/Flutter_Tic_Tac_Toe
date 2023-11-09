import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/styling/styled_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
          Stack(
            children: [
              Text(
                'WELCOME TO\n TIC TAC TOE!',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    foreground: (Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 10
                      ..color = colorScheme.inverseSurface),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'WELCOME TO\n TIC TAC TOE!',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: colorScheme.background,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(10.0, 10.0),
                        blurRadius: 10.0,
                        color: colorScheme.inverseSurface,
                      ),
                    ],
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          StyledButton(
            radius: 20.0, 
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
