import 'package:flutter/material.dart';

class BoardCell extends StatelessWidget {
  const BoardCell({
    super.key,
    required this.index,
    required this.board,
    required this.onPressCell,
  });

  final int index;
  final List<String> board;
  final VoidCallback onPressCell;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: FilledButton.tonal(
            onPressed: onPressCell,
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all(colorScheme.inversePrimary),
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
            ),
            child: Text(board[index]),
          ),
        ),
      ],
    );
  }
}
