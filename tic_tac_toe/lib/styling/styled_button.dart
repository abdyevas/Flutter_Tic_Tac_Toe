import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    this.radius = 10.0,
    this.overlayColor = Colors.transparent,
    this.padding = 15.0,
    super.key,
    required this.child,
    required this.onPressButton,
  });

  final Widget? child;
  final double radius; 
  final Color overlayColor;
  final double padding;
  final VoidCallback? onPressButton;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FilledButton.tonal(
      onPressed: onPressButton,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(overlayColor),
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.pressed) ? 5.0 : 15.0,
        ),
        shadowColor: MaterialStateProperty.all(colorScheme.inverseSurface),
        padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: colorScheme.inverseSurface,
            width: 5.0,
          ),
        ),
      ),
      child: child,
    );
  }
}
