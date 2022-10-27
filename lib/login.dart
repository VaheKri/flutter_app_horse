import 'package:flutter/material.dart';
import 'package:flutter_app/buttonBar.dart';
import 'package:flutter_app/register.dart';

import 'Mango/MangoDB.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  static const tag = "Login_page";
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container (
                  margin: const EdgeInsets.only(right: 300, top: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => const buttonBar(title: '',)
                        ),
                      );
                    },
                    child: const Text("Button Bar"),
                  ),
                ),
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
                  child: const Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                                    hintText: "Email or Phone number",
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
                          ],
                        ),
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      (Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            child: const Text("Login"),
                          ))),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          child: const Text('Forgot Password ?'),
                          onPressed: () {
                            // Navigator.push(context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const (title: '',)
                            //   ),
                            // );
                          }
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      (const Text(
                        "You do not have an account",
                        style: TextStyle(color: Color(0xff2196f3)),
                      )),
                      TextButton(
                          child: Text('Create One !'),
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage(title: '',)
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