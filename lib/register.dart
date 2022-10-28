import 'package:flutter/material.dart';

import 'Mango/MangoDB.dart';
import 'login.dart';


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
  final TextEditingController _profilPicture = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 142,
                  width: 300,
                  margin: const EdgeInsets.only(top: 100),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://miro.medium.com/max/500/1*D5afxg0H9xyxfqRq_bfTgQ.png"),
                    ),
                  ),
                ),
                Container (
                  margin: const EdgeInsets.only(top: 30),
                  child: const Text('Register', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      (Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                controller: _username,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _password,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _mail,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mail",
                                    hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _profilPicture,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "URL profil picture",
                                    hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      (Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: ElevatedButton(
                            onPressed: () {
                              MangoDatabase.registerUser(
                                  _username.text, _password.text, _mail.text,_profilPicture.text);
                              Navigator.pop(context);
                            },
                            child: Text("Register"),
                          ))),
                      SizedBox(
                        height: 30,
                      ),
                      (const Text(
                        "Already have an account",
                        style: TextStyle(color: Color(0xff2196f3)),                  )),
                      TextButton(
                          child: const Text('Login !'),
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage(title: '',)
                              ),
                            );
                          }
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}