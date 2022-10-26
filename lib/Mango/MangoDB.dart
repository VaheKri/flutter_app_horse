import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constantMango.dart';

class MangoDatabase {
  static var db,collection;
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    //print(status);
    var collection = db.collection(COLLECTION_NAME);
    return db;
    //print(await collection.find().toList());
    /*await collection.update(
        where.eq("username", "babacar225"), modify.set("name", "Mz"));*/
    //print(await collection.find().toList());
  }

  void registerUser(String username, String password, String mail) async{
    var db = connect();
    var collection = db.collection(COLLECTION_NAME);
    await collection.insertOne([
      {
        "username": username,
        "name": password,
        "email": mail
      },
    ]);
  }

}