import 'dart:convert';
import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constantMango.dart';
import 'dart:math';

class evenement{
  var Date = [];
  String type = "";
  var participant = "";

  evenement(){this.Date;this.type;this.participant;}
}

class MangoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var _eventPoney = await db.collection('event');
    await _eventPoney.insertMany([
      {
        'Date': [27, 2, 2022],
        'type': 'soirer',
        'participant': ['Antoine', 'Pierre'],
      }, {'Date': [28, 3, 2023],
        'type': 'concourt',
        'participant': ["Jean", 'Paul'],}
    ]);

  }

  //static openCollection(var db)

  static findDB() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    return db;

  }

  Future<List> getEvent() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var _eventPoney = await db.collection('event');
    var _eventData =  await _eventPoney.find().toList();
    return _eventData;

  }


  static registerUser(dynamic username, dynamic password, dynamic mail, dynamic imageURL ) async {
    var db = await Db.create(MONGO_URL);
    Random random = new Random();
    int randomNumber = random.nextInt(10000);
    await db.open();
    await db.collection('users').insertOne(<String, dynamic>{
      'username': username,
      'password': password,
      'email': mail,
      "profilePicture": imageURL,
      "id": randomNumber
    });

  }

  static updateData(dynamic dataWanted, dynamic notModifyData, dynamic dataModified,dynamic selectedCollection) async{
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(selectedCollection);
    await collection.update(
        where.eq(dataWanted, notModifyData),modify.set(dataWanted, dataModified));
  }

  void deleteData(dynamic dataWanted,dynamic dataSelected,dynamic selectedCollection) async{
    var db = connect();
    var collection = db.collection(selectedCollection);
    await collection.remove(where.eq(dataWanted, dataSelected));
  }

}