import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling/home_page.dart';

import '../controllers/controller.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, required this.sessionCompleted});

  final bool sessionCompleted;

  @override
  Widget build(BuildContext context) {

    String title = "Well Done!";
    String buttonText = "New Word";
    if(sessionCompleted){
      title = "All Words Completed!";
      buttonText = "Replay";
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      backgroundColor: Colors.amber,
      actionsAlignment: MainAxisAlignment.center,
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colors.black)),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          ),
            onPressed: () {
              if(sessionCompleted){
                Provider.of<Controller>(context,listen: false).reset();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) =>const HomePage())));
              }else{
                // muda a requisição para verdadeiro
                Provider.of<Controller>(context,listen: false).requrestWord(request: true);
                Navigator.of(context).pop();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(buttonText,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 30)),
            ))
      ],
    );
  }
}
