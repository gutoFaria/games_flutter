import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling/controllers/controller.dart';

import 'home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    // classe que irá controlar as interações
    create: (_) => Controller(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'PartyConfetti',
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white
          )
        )
      ),
      home: const HomePage(),
    );
  }
}




