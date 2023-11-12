import 'package:flutter/material.dart';

class ShowWinner {
  static void show(BuildContext context) {
    showDialog(context: context, builder: 
    (BuildContext context) {
      return AlertDialog(
        title: Text('Congs'),
        content: Text('you win'),
      
      );  },
    );
  }
}
