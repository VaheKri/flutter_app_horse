import 'package:flutter/material.dart';
import 'package:flutter_app/Mango/MangoDB.dart';


class SocialEventPage extends StatefulWidget {
  const SocialEventPage({super.key, required this.title});

  static const tag = "Register_page";
  final String title;

  @override
  State<SocialEventPage> createState() => _SocialEventPageState();
}

class _SocialEventPageState extends State<SocialEventPage> {
  final _eveningtheme = ["Aperitif", "Repast"];

  String _selectedVal = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  title: const Text('Schedule a social event'),
                  content: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 270,
                            child: DropdownButtonFormField(
                              hint: const Text('Evening theme'),
                              items: _eveningtheme.map(
                                    (e) =>
                                    DropdownMenuItem(
                                      child: Text(e), value: e,),
                              ).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selectedVal = val as String;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down_circle,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: () {

                                }, child: const Text('Save')
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




  // final TextEditingController _username = TextEditingController();
  // final TextEditingControl