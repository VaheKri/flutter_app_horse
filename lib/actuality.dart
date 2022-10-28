import 'package:flutter/material.dart';
import 'Mango/MangoDB.dart';

class ActualityPage extends StatefulWidget {
  const ActualityPage({super.key, required this.title});

  static const tag = "Actuality_page";
  final String title;

  @override
  State<ActualityPage> createState() => _ActualityPageState();
}

class _ActualityPageState extends State<ActualityPage> {

final today = DateTime.now();
int _Dateoftheday = 0;

void setdateday(int dateiterator){
  setState(() {
    _Dateoftheday=dateiterator;
  });
}

String? weekDay(int _intweekday){
  String? _weekday;
  if (_intweekday>7){
    _intweekday -= 7;
  }
  if (_intweekday==1){
    _weekday="Mon";
  }else if (_intweekday==2){
    _weekday="Tue";
  }else if (_intweekday==3){
    _weekday="Wed";
  }else if (_intweekday==4){
    _weekday="Thu";
  }else if (_intweekday==5){
    _weekday="Fri";
  }else if (_intweekday==6){
    _weekday="Sat";
  }else if (_intweekday==7){
    _weekday="Sun";
  }
  return _weekday;
}
int integerday(int _currentday){
  int _dateday=_currentday;
  if (_dateday>31){
    _dateday= _currentday-31;
  }
  return _dateday;
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
        Center(
          child: Column(
            children: [
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
              child :
              Row(children: [
                for(int i=0;i<7;i++) ...[
            Column(children: [
            Text(weekDay(today.weekday+i).toString()),
            ElevatedButton(style: ElevatedButton.styleFrom(shape: CircleBorder(),padding: EdgeInsets.all(12)), onPressed: ()=>{setdateday(i) } , child:Text((integerday(today.day+i)).toString()),)
            ])]
              ],)),
                FutureBuilder(
                future:   MangoDatabase().getDataList('event') , // a previously-obtained Future<String> or null
                builder: ( context,  snapshot) {
                  List showActuality() {
                    List _currentListEvent = [];
                    int _Dateday = integerday(today.day + _Dateoftheday);
                    if (snapshot.data != null) {
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        var date = snapshot.data![i]["Date"][0];
                        if (date == _Dateday) {
                          _currentListEvent.add(snapshot.data![i]);
                        }
                      }
                    }
                    return _currentListEvent;
                  }

                  var listevent = showActuality();

                  return Column(children: [
                    for (var event = 0; event < listevent.length; event++) ...[
                      Card(
                        child: Column(
                          children: [
                            Text(listevent[event]["type"]),
                            Text("participant : " + listevent[event]["participant"].toString())
                          ],
                        ),
                      )
                    ]

                  ]
                  );
                }
                )
            ],
          ),
        )
    );
  }

}
