import 'package:flutter/material.dart';

class MyGameScreen extends StatefulWidget {
  const MyGameScreen({super.key});

  @override
  State<MyGameScreen> createState() => _MyGameScreen();
}

class _MyGameScreen extends State<MyGameScreen> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.onPrimaryContainer,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 150,
          ),
          SizedBox(
            height: 500,
            child: GridView.builder(
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
                                board[index] = currentPlayer;
                                currentPlayer =
                                    (currentPlayer == 'X') ? 'O' : 'X';
                              },
                            );
                          }
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              colorScheme.inversePrimary),
                          elevation: MaterialStateProperty.resolveWith<double>(
                            (Set<MaterialState> states) =>
                                states.contains(MaterialState.pressed)
                                    ? 5.0
                                    : 15.0,
                          ),
                          shadowColor: MaterialStateProperty.all(
                              colorScheme.inverseSurface),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
          ),
        ],
      ),
    );
  }
}
