import 'package:flutter/material.dart';

class MyGameScreen extends StatefulWidget {
  const MyGameScreen({super.key});

  @override
  State<MyGameScreen> createState() => _MyGameScreen();
}

class _MyGameScreen extends State<MyGameScreen> {
  List<String> board = List.filled(9, '');

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: FilledButton.tonal(
                  onPressed: () {
                    if (board[index].isEmpty) {
                      setState(
                        () {
                          board[index] = 'X';
                        },
                      );
                    }
                  },
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(colorScheme.inversePrimary),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) =>
                          states.contains(MaterialState.pressed) ? 5.0 : 15.0,
                    ),
                    shadowColor:
                        MaterialStateProperty.all(colorScheme.inversePrimary),
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
        },
      ),
    );
  }
}
