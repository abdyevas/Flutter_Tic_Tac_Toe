import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: FilledButton.tonal(
            onPressed: (gameOver && isEnabled)
                ? null
                : () {
                    onPressCell();
                  },
            style: ButtonStyle(
              overlayColor: (gameOver)
                ? MaterialStateProperty.all(Colors.transparent)
                : MaterialStateProperty.all(colorScheme.inversePrimary),
              elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) =>
                    states.contains(MaterialState.pressed) ? 5.0 : 15.0,
              ),
              shadowColor:
                  MaterialStateProperty.all(colorScheme.inverseSurface),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: colorScheme.inverseSurface, 
                  width: 5.0, 
                ),
              ),
            ),
            child: Transform.translate(
              offset: const Offset(0, -5),
              child: Center(
                child: Stack(
                  children: [
                    Text(
                      board[index],
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          foreground: (gameOver && isDraw)
                              ? (Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 5
                                ..color = colorScheme.inverseSurface)
                              : (Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 10
                                ..color = colorScheme.inverseSurface),
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      board[index],
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: (gameOver && isDraw)
                              ? colorScheme.inverseSurface
                              : colorScheme.inversePrimary,
                          shadows: (gameOver && isDraw)
                              ? null
                              : <Shadow>[
                                  Shadow(
                                    offset: const Offset(10.0, 10.0),
                                    blurRadius: 10.0,
                                    color: colorScheme.inverseSurface,
                                  ),
                                ],
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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
