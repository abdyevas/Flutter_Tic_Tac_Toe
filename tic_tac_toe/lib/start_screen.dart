import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          FilledButton.tonal(
            onPressed: () {},
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all(colorScheme.inversePrimary),
              elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) =>
                    states.contains(MaterialState.pressed) ? 5.0 : 15.0,
              ),
              shadowColor:
                  MaterialStateProperty.all(colorScheme.inverseSurface),
              padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: colorScheme.inverseSurface,
                  width: 5.0,
                ),
              ),
            ),
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
