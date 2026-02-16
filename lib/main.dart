import 'package:flutter/material.dart';

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
          child: const BallSelector(),
        ),
      ),
    );
  }
}


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


class BallSelector extends StatelessWidget {
  const BallSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(onTap: () { debugPrint("green"); }, child: const Ball(color: Colors.green)),
        GestureDetector(onTap: () { debugPrint("red"); }, child: const Ball(color: Colors.red)),
        GestureDetector(onTap: () { debugPrint("blue"); }, child: const Ball(color: Colors.blue)),
        GestureDetector(onTap: () { debugPrint("yellow"); }, child: const Ball(color: Colors.yellow)),
      ],
    );
  }
}
