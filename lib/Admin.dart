import 'package:flutter/material.dart';
import 'Mango/MangoDB.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key, required this.title});

  static const tag = "Admin_page";
  final String title;

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  int pages = 0;

  void updatepage(int page){
    setState(() {
      pages = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
        Center(child:
        Column(children: [
          Row(children: [
            ElevatedButton(onPressed: () {
              updatepage(0);
            }, child: Text('Horses')),
            ElevatedButton(onPressed: () {
              updatepage(1);
            }, child: Text('Riders')),
            ElevatedButton(onPressed: () {
              updatepage(2);
            }, child: Text('Courses')),
            ElevatedButton(onPressed: () {
              updatepage(3);
            }, child: Text('Party'))
          ],),
          if(pages == 0)...[
            FutureBuilder(
                future: MangoDatabase().getDataList('horses'),
                builder: (context, snapshot) {

                  return Column(children: [
                    SingleChildScrollView(
                        scrollDirection: Axis.vertical),
                    if(snapshot.data!=null)...[
                    for(int i = 0; i < snapshot.data!.length; i++)...[
                      Card(child: Row(children: [
                        Text(snapshot.data![i]["name"]),
                        ElevatedButton(onPressed: (){  setState(() {
                          MangoDatabase.deleteData("name",snapshot.data![i]["name"],"horses");
                        });}, child: Text("Delete"))
                      ],),
                      )
                    ]]
                  ]);
                }
            )
          ],
          if(pages == 1)...[
            FutureBuilder(
                future: MangoDatabase().getDataList('users'),
                // a previously-obtained Future<String> or null
                builder: (context, snapshot) {
                  return Column(children: [
                    SingleChildScrollView(
                        scrollDirection: Axis.vertical),
                    if(snapshot.data!=null)...[
                      for(int i = 0; i < snapshot.data!.length; i++)...[
                        Card(child: Row(children: [
                          Text(snapshot.data![i]["username"]),
                          ElevatedButton(onPressed:(){  setState(() {
                            MangoDatabase.deleteData('username', snapshot.data![i]["username"],"users");});
                           print(snapshot.data![i]["horses"]);
                            }, child: Text("delete"))
                        ],),
                        )
                      ]
                    ]
                  ]);
                }
            )
          ],
          if(pages == 2)...[
            FutureBuilder(
                future: MangoDatabase().getDataList('event'),
                builder: (context, snapshot) {
                  List getcourse() {
                    List _courselist = [];
                    if (snapshot.data != null) {
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        var type = snapshot.data![i]["type"];
                        if (type == "course") {
                          _courselist.add(snapshot.data![i]);
                        }
                      }
                    }
                    return _courselist;
                  }

                  var course = getcourse();
                  return
                    SingleChildScrollView(
                        scrollDirection: Axis.vertical,child :Column(children: [
                    if(snapshot.data!=null)...[
                      for(int i = 0; i < course.length; i++)...[
                        Card(child: Row(children: [
                          Text(course[i]["name"]),
                          ElevatedButton(onPressed:(){ }, child: Text("accept")),
                          ElevatedButton(onPressed:(){  setState(() {MangoDatabase.delete(snapshot.data![i],"event"); });}, child: Text("refuse"))
                        ],),
                        )
                      ]
                    ]
                  ])
                  );
                }
            )
          ],    if(pages == 3)...[
            FutureBuilder(
                future: MangoDatabase().getDataList('event'),
                builder: (context, snapshot) {
                  List getparty() {
                    List _partylist = [];
                    if (snapshot.data != null) {
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        var type = snapshot.data![i]["type"];
                        if (type == "party") {
                          _partylist.add(snapshot.data![i]);
                        }
                      }
                    }
                    return _partylist;
                  }

                  var party = getparty();
                  return Column(children: [
                    SingleChildScrollView(
                        scrollDirection: Axis.vertical),
                    if(snapshot.data!=null)...[
                      for(int i = 0; i < party.length; i++)...[
                        Card(child: Row(children: [
                          Text(party[i]["name"]),
                          ElevatedButton(onPressed:(){ }, child: Text("accept")),
                          ElevatedButton(onPressed:(){  setState(() {MangoDatabase.delete(snapshot.data![i],"event"); });}, child: Text("refuse"))
                        ],),
                        )
                      ]
                    ]
                  ]);
                }
            )
          ]
        ],),)
    );
  }
}