import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constantMango.dart';

class MangoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);
    await collection.insertMany([
      {
        "username": "babacar225",
        "name": "babacar",
        "email": "babacar@gmail.com"
      },
      {"username": "leDucZer", "name": "b2o", "email": "duczer@gmail.com"},
      {"username": "kb9", "name": "Benzema", "email": "benze@gmail.com"}
    ]);
    print(await collection.find().toList());
    await collection.update(
        where.eq("username", "babacar225"), modify.set("name", "Mz"));
    print(await collection.find().toList());

  }
}