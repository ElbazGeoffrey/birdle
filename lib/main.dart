import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: const BallSelector(ballSelected: ballSelected),
        ),
      ),
    );
  }
}


//literally just a colored circle
class Ball extends StatelessWidget {
    const Ball({super.key, required this.color});
    final Color color;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}



//row buttons to select what color to put next
class BallSelector extends StatelessWidget {
  const BallSelector({super.key, required this.ballSelected});

  final void Function(Color) ballSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            debugPrint("green"); 

            ballSelected(Colors.green);
          }
          , child: const Ball(color: Colors.green)
        ),

        GestureDetector(
          onTap: () {
            debugPrint("red");

            ballSelected(Colors.red);
          }, 
          child: const Ball(color: Colors.red)
        ),

        GestureDetector(
          onTap: () { 
            debugPrint("blue"); 

            ballSelected(Colors.blue);
          },
          child: const Ball(color: Colors.blue)
        ),

        GestureDetector(
          onTap: () {
            debugPrint("yellow");

            ballSelected(Colors.yellow);
          },
          child: const Ball(color: Colors.yellow)
        ),
      ],
    );
  }
}
