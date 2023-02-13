import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game/utils/utils.dart';

import 'models/equacao.dart';
import 'models/resposta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Equacao> equacoes = [];
  List<Resposta> respostas = [];
  int cont = 0;
  late int score;
  late bool gameOver;

  @override
  void iniState(){
    super.initState();
    startGame();
  }

  startGame(){
    gameOver = false;
    score = 0;
    for (var element in eSoma) {
      var res = element.split('=') as String;
      var eq = Equacao(res[0], cont,false);
      var re = Resposta(res[1], cont,false);
      equacoes.add(eq);
      respostas.add(re);
      cont++;
    }

    equacoes.shuffle();
    respostas.shuffle();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
       
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Math Game'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text.rich(TextSpan(
                children: [
                  const TextSpan(text: 'Score:'),
                  TextSpan(text:'$score',
                  style:const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                  ),
                  ),
                ]
              ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

