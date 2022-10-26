import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class buttonBar extends StatefulWidget {
  const buttonBar({super.key, required this.title});


  final String title;

  State<buttonBar> createState() => _buttonBarState();

}

class _buttonBarState extends State<buttonBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row (
          children: [
            ElevatedButton(
              onPressed: () {
              //   Navigator.push(context,
              //   MaterialPageRoute(
              //       builder: (context) => const MyApp()
              //   ),
              // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[600],
                padding: const EdgeInsets.all(10),
                side: const BorderSide(width: 1.0, color: Colors.white),
              ),
              child: const Text('Other page 1'),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  //   Navigator.push(context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const MySecondPage(title: 'Créer un jeu',)
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[600],
                  padding: const EdgeInsets.all(10),
                  side: const BorderSide(width: 1.0, color: Colors.white),
                ),
                child: const Text('Other pag 2'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //   Navigator.push(context,
                //   MaterialPageRoute(
                //       builder: (context) => const MySecondPage(title: 'Créer un jeu',)
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[600],
                padding: const EdgeInsets.all(10),
                side: const BorderSide(width: 1.0, color: Colors.white),
              ),
              child: const Text('Other page 3'),
            ),
          ]
      ),
      ),
    );
  }


}