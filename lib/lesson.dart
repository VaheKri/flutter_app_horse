import 'package:flutter/material.dart';
import 'package:flutter_app/Mango/MangoDB.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key, required this.title});

  static const tag = "Register_page";
  final String title;

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  // final TextEditingController _username = TextEditingController();
  // final TextEditingController _password = TextEditingController();
  // final TextEditingController _mail = TextEditingController();
  // final TextEditingController _profilPicture = TextEditingController();

  final _landList = ["Career", "Carrousel"];
  final _durationList = ["30 Min", "1 Hour"];
  final _activityList = ["Dressage", "Show jumping", "Stamina"];
  String _selectedDuration = "";
  String _selectedLand = "";
  String _selectedActivity = "";
  String _selectedDate = "";

  DateTime dateTime = DateTime(2022, 10, 27, 17, 30);


  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString();
    final minutes = dateTime.minute.toString();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  title: const Text('Schedule a Riding Lesson'),
                  content: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 270,
                            child: DropdownButtonFormField(
                                hint: const Text('Training ground'),
                                items: _landList
                                    .map(
                                      (e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ),
                                )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _selectedLand = val as String;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Colors.blue,
                                )),
                          ),
                          Container(
                            width: 250,
                            child: ElevatedButton(
                              onPressed: () async {
                                final time = await pickTime();
                                if (time == null) return;

                                final newDateTime = DateTime(
                                  dateTime.day,
                                  dateTime.month,
                                  dateTime.year,
                                  time.hour,
                                  time.minute,
                                );

                                setState(() => dateTime = newDateTime);
                              },
                              child: Text('$hours:$minutes',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: 250,
                            child: ElevatedButton(
                              onPressed: () async {
                                final date = await pickDate();
                                if (date == null) return;

                              //  final newDateTime = DateTime(
                               //   date.day,
                               //   date.month,
                                //  date.year,
                               //   dateTime.hour,
                               //   dateTime.minute,
                             //   );
                                setState(() => dateTime = date);
                              },
                              child: Text(
                                  '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: 270,
                            padding: const EdgeInsets.all(10),
                            child: DropdownButtonFormField(
                                hint: const Text('Duration of activity'),
                                items: _durationList
                                    .map(
                                      (e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ),
                                )
                                    .toList(),
                                onChanged: (val) {
                                  setState(()  {
                                    _selectedDuration = val as String;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Colors.blue,
                                )),
                          ),
                          Container(
                            width: 270,
                            padding: const EdgeInsets.all(10),
                            child: DropdownButtonFormField(
                                hint: const Text('Activity'),
                                items: _activityList
                                    .map(
                                      (e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ),
                                )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _selectedActivity = val as String;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Colors.blue,
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: () async{
                                  MangoDatabase.registerEvent(
                                      _selectedLand,
                                      _selectedActivity,
                                      _selectedDate,
                                      _selectedDuration);
                                },
                                child: Text('Save')),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },

      ),
      body: Center(

        child: Column(


          children: [
            Container( padding: const EdgeInsets.all(100),
              child: ElevatedButton(
                  onPressed: () async{
                    MangoDatabase.registerEvent(
                        _selectedLand,
                        _selectedActivity,
                        _selectedDate,
                        _selectedDuration);
                  },
                  child: Text('Save')),),

            ListView.builder(
                itemCount: MangoDatabase.loopNumber,
                itemBuilder: (context, i) {
                  return ListBody(
                    children:[
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 220,
                            width: 220,
                            child: Card(
                              child: Text(MangoDatabase.ActualList[i].toString()),
                              elevation: 5,
                            color: Colors.red,),),

                        ],
                      )
                    ],

                  );
                })
          ],
        ),

      ),

 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        initialDate: dateTime,
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );
}
