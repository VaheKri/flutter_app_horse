import 'package:flutter/material.dart';
import 'package:flutter_app_horse/actuality.dart';
import 'package:flutter_app_horse/register.dart';
import 'Mango/MangoDB.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MangoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {RegisterPage.tag:(context)=>RegisterPage(title: 'Register'), ActualityPage.tag:(context)=>ActualityPage(title: 'Actuality')},
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children:[
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed(RegisterPage.tag);
              },
              child: Text("Register"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed(ActualityPage.tag);
              },
              child: Text("Actuality"),
            ),
          ])
      ),

    );
  }
}
