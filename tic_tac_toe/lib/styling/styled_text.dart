import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    this.borderWidth = 10.0,
    this.fontSize = 70.0,
    super.key,
    required this.text,
    required this.textColor,
    required this.shadow,
  });

  final String text;
  final double borderWidth;
  final double fontSize; 
  final Color textColor;
  final List<Shadow>? shadow;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Text(
          text,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              foreground: (Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = borderWidth
                ..color = colorScheme.inverseSurface),
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: textColor,
              shadows: shadow,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
