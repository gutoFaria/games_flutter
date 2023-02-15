import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling/widgets/fly_in_anmation.dart';
import 'package:spelling/widgets/progress_bar.dart';

import 'all_words.dart';
import 'controllers/controller.dart';
import 'widgets/drag.dart';
import 'widgets/drop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _words = allWords.toList();
  late String _word;
  String _dropWord = "";

  // @override
  // void initState() {
  //   super.initState();
  // }

  _generateWord() {
    final r = Random().nextInt(_words.length);
    _word = _words[r];
    _dropWord = _word;
    // para não redenrizar mais a palavra
    _words.removeAt(r);
    final s = _word.characters.toList()..shuffle();
    _word = s.join();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // chamar a classe controller com o provider
      //passando o total de letras que será utilizado
      Provider.of<Controller>(context, listen: false)
          .setUp(total: _word.length);

      //passando a requsição para falso, para não puxar a palavra
      Provider.of<Controller>(context, listen: false).requrestWord(request: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<Controller, bool>(
      selector: (_, controller) => controller.generateWord,
      builder: (_, generate, __) {
        if(generate){
          if(_words.isNotEmpty){
            _generateWord();
          }
          
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(
                                  child: Text('Spelling Bee',
                                  style: Theme.of(context).textTheme.headline1,),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Image.asset('assets/images/Bee.png'),
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _dropWord.characters
                          .map((e) =>  Drop(
                                  letter: e,
                                ),
                          )
                          .toList(),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                    child: Image.asset('assets/images/$_dropWord.png')
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          _word.characters.map((e) => Drag(letter: e)).toList(),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.pink,
                    child: const ProgressBar(),
                  )),
            ],
          ),
        );
      },
    );
  }
}
