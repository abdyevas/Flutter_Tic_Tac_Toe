import 'package:flutter/material.dart';

class DisplayScore extends StatelessWidget {
  final int playerXScore;
  final int playerOScore;

  DisplayScore({required this.playerXScore, required this.playerOScore});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center();
  }
}