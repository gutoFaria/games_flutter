import 'package:flutter/material.dart';
import 'package:memory_game/screens/easy_game.dart';

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
      Center(
        child: Container(
          width: 300,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/panelCloud.png"),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EasyGame()),
                          (Route<dynamic> route) => false,
                        );
                  },
                  child: Container(
                    width: 150,
                    height: 45,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/btn_easy.png"),
                            fit: BoxFit.cover)
                            ),
                    child:const Center(
                      child: Text('Fácil',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  child: Container(
                    width: 150,
                    height: 45,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/btn_medium.png"),
                            fit: BoxFit.cover)),
                          child:const Center(
                      child: Text('Médio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  child: Container(
                    width: 150,
                    height: 45,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/btn_hard.png"),
                            fit: BoxFit.cover)),
                    child:const Center(
                      child: Text('Difícil',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
