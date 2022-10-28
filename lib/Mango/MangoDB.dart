import 'dart:convert';
import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constantMango.dart';
import 'dart:math';

class MangoDatabase {
  static var db,collection;
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);

    await db.collection('horses').insertMany([{
      'name': 'pegaze',
      'owner': 'tom',
      'DP': true,
      "listDP": ["lea","paul"]
    },{
      'name': 'tonnerre',
      'owner': 'manon',
      'DP': false,
      "listDP": [],
    }]);
  }

  //static openCollection(var db)

  static findDB() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
  }

  //static openCollection(var db)

  Future<List> getDataList(String collection) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var _collection = await db.collection(collection);
    var _datalist =  await _collection.find().toList();
    return _datalist;

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

  static deleteData(dynamic dataWanted,dynamic dataSelected,dynamic selectedCollection) async{
    var db = connect();
    var collection = db.collection(selectedCollection);
    await collection.remove(dataWanted, dataSelected);
  }
  static delete(dynamic dataWanted,dynamic dataSelected) async{
    var db = connect();
    var collection = db.collection("users");
    await collection.deleteOne(dataWanted, dataSelected);
  }
}