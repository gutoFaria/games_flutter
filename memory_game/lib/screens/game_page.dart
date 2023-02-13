import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/models/carta_model.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<CartaModel> cartas1 = [];
  List<CartaModel> cartas2 = [];
  List<CartaModel> cartas = [];


  startGame() {
    cartas1 = [
      CartaModel('assets/cartas/img1.png', 1),
      CartaModel('assets/cartas/img2.png', 2),
      CartaModel('assets/cartas/img3.png', 3),
      CartaModel('assets/cartas/img4.png', 4),
      CartaModel('assets/cartas/img5.png', 5),
      CartaModel('assets/cartas/img6.png', 6),
      CartaModel('assets/cartas/img7.png', 7),
      CartaModel('assets/cartas/img8.png', 8),
      CartaModel('assets/cartas/img9.png', 9),
      CartaModel('assets/cartas/img10.png', 10),
    ];
    cartas2 = List<CartaModel>.from(cartas1);
    cartas1.shuffle();
    cartas2.shuffle();

    for (var c in cartas1) {
      cartas.add(c);
    }
    for (var c in cartas2) {
      cartas.add(c);
    }

    cartas.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    print(cartas.length);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/redportraitBg.png"),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Container(
              width: 400,
              height: 600,
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: cartas.map((carta) {
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                      front: Container(
                        width: 50,
                        height: 50,
                        decoration:const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/cartas/back.png"),
                                fit: BoxFit.cover)),
                      ),
                      back: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("${carta.img}"),
                                fit: BoxFit.cover)),
                      ));
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
