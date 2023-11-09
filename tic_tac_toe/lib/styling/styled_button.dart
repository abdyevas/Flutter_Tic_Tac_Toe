import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.child,
    required this.radius,
  });

  final Widget? child;
  final double radius; 

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FilledButton.tonal(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(colorScheme.inversePrimary),
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.pressed) ? 5.0 : 15.0,
        ),
        shadowColor: MaterialStateProperty.all(colorScheme.inverseSurface),
        padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
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
