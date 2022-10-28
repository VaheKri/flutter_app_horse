import 'package:flutter/material.dart';
import 'package:flutter_app/lesson.dart';

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
        automaticallyImplyLeading: false,
        title: Row (
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover),
                  border: Border.all(color: Colors.white, width: 2 ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => const LessonPage(title: 'Activity',)
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[600],
                  padding: const EdgeInsets.all(10),
                  side: const BorderSide(width: 1.0, color: Colors.white),
                ),
                child: const Text('Activity'),
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
                  child: const Text('Other pag'),
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
                child: const Text('Other pag'),
              ),
            ]
        ),
      ),
    );
  }


}