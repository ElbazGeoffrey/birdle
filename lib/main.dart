import 'package:flutter/material.dart';
import 'game_controller.dart';
import 'game_model.dart';

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
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameController controller;

  @override
  void initState() {
    super.initState();
    controller = GameController(
      engine: GameEngine(
        secret: [Colors.blue, Colors.red, Colors.green, Colors.yellow],
      ),
    );

    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: List.generate(
          GameController.maxRows,
          (row) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              GameController.rowLength,
              (col) => Padding(
                padding: const EdgeInsets.all(4),
                child: Tile(
                  color: controller.guesses[row][col],
                  hitType: controller.results[row][col],
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      BallSelector(
        ballSelected: controller.selectColor,
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: controller.validateTurn,
        child: const Text("Validate"),
      ),
      const SizedBox(height: 10),
      if (controller.gameOver)
        Text(
          controller.hasWon ? "You Win 🎉" : "Game Over ❌",
          style: const TextStyle(fontSize: 20),
        ),
      if (controller.gameOver)
        ElevatedButton(
          onPressed: controller.resetGame,
          child: const Text("Restart"),
        ),
    ],
  );
}
}

class Tile extends StatelessWidget {
  const Tile({super.key, required this.color, required this.hitType});
  final Color color;
  final HitType hitType;

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
      child: Center(child: Ball(color: color)),
    );
  }
}

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

class BallSelector extends StatelessWidget {
  const BallSelector({super.key, required this.ballSelected});
  final void Function(Color) ballSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => ballSelected(Colors.green),
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: const Ball(color: Colors.green),
            )
          )
        ),
        GestureDetector(
          onTap: () => ballSelected(Colors.red),
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: const Ball(color: Colors.red),
            )
          )
        ),
        GestureDetector(
          onTap: () => ballSelected(Colors.blue),
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: const Ball(color: Colors.blue),
            )
          )
        ),
        GestureDetector(
          onTap: () => ballSelected(Colors.yellow),
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: const Ball(color: Colors.yellow),
            )
          )
        ),
      ],
    );
  }
}
