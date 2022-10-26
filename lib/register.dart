import 'package:flutter/material.dart';
import 'Mango/MangoDB.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  static const tag = "Register_page";
  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'User name :'),
                  controller: _username,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password :'),
                  controller: _password,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'mail :'),
                  controller: _mail,
                ),
                ElevatedButton(
                  onPressed: (){
                   MangoDatabase().registerUser(_username.text, _password.text, _mail.text);
                   Navigator.pop(context);
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        )
    );
  }
}