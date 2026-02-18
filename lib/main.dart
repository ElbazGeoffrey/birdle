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
          child: GameScreen(),
        ),
      ),
    );
  }
}


class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  HitType currentHit = HitType.none;
  Color selectedColor = Colors.transparent;
  
  void ballSelected(Color color) {
  setState(() {
      selectedColor = color;
      if (color == Colors.blue) {
         currentHit= HitType.hit;
      }
      else {
          currentHit = HitType.miss;
        }
    }

  );
  }

   @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Tile(color: selectedColor, hitType: currentHit),
        const SizedBox(height: 20),
        BallSelector(ballSelected: ballSelected),
      ],
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
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 2),
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
          },
          child: Center(
            child:
              SizedBox(
                width: 50,
                height: 50,
                child: const Ball(color: Colors.green),
              ),
          ),
        ),

        GestureDetector(
          onTap: () {
            debugPrint("red");

            ballSelected(Colors.red);
          }, 
          child: Center(
            child:
              SizedBox(
                width: 50,
                height: 50,
                child: const Ball(color: Colors.red),
              ),
          ),
        ),

        GestureDetector(
          onTap: () { 
            debugPrint("blue"); 

            ballSelected(Colors.blue);
          },
          child: Center(
            child:
              SizedBox(
                width: 50,
                height: 50,
                child: const Ball(color: Colors.blue),
              ),
          ),
        ),

        GestureDetector(
          onTap: () {
            debugPrint("yellow");

            ballSelected(Colors.yellow);
          },
          child: Center(
            child:
              SizedBox(
                width: 50,
                height: 50,
                child: const Ball(color: Colors.yellow),
              ),
          ),
        ),
      ],
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({super.key, required this.color, required this.hitType});

  final HitType hitType;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),

        color: switch (hitType) {
          HitType.hit => Colors.green,
          HitType.partial => Colors.yellow,
          HitType.miss => Colors.grey,
          _ => Colors.white,
        },
      ),
      child: Center(
        child: SizedBox(
          width: 50,  
          height: 50,
          child: Ball(color: color),
        ),
      ),
    );
  }
}

