import 'package:flutter/material.dart';


class EasyGame extends StatefulWidget {
  const EasyGame({super.key});

  @override
  State<EasyGame> createState() => _EasyGameState();
}

class _EasyGameState extends State<EasyGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}