import 'package:flutter/material.dart';

import 'game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/greenPortraitBg.png"),
                fit: BoxFit.cover)),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'MEMORY',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 96, 204, 231),
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            'GAME',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 96, 204, 231),
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const GamePage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Container(
                width: 150,
                height: 45,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/btn_easy.png"),
                        fit: BoxFit.cover)),
                child: const Center(
                  child: Text(
                    'START',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ]));
  }
}
