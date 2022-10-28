import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constantMango.dart';
import 'dart:math';

class MangoDatabase {
  static late ActualUser OnlineUser;
  static bool ifUserOnline = false;
  static var ActualList = [];
  static int loopNumber = -1;

  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
  }

  //static openCollection(var db)

  static findDB() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    return db;
  }

  static registerUser(dynamic username, dynamic password, dynamic mail,
      dynamic imageURL) async {
    var db = await Db.create(MONGO_URL);
    Random random = new Random();
    int randomNumber = random.nextInt(10000);
    await db.open();
    await db.collection('users').insertOne(<String, dynamic>{
      'username': username,
      'password': password,
      'email': mail,
      "profilePicture": imageURL,
      "id": randomNumber,
      "birth": "",
      "accountFFE": '',
      "phoneNumber": '',
    });
  }

  static registerEvent(
      dynamic land, dynamic lesson, dynamic date, dynamic duration) async {
    var db = await Db.create(MONGO_URL);
    Random random = new Random();
    int randomNumber = random.nextInt(10000);
    await db.open();
    await db.collection(COLLECTION_EVENT).insertOne(<String, dynamic>{
      "land": land,
      "lesson": lesson,
      //"night": night,
      "date": date,
      "duration": duration,
      //"skill":skill,
      //"exam":exam
      "lesson_id": randomNumber,
      "id": "100",
    });
  }

  static registerHorse(dynamic horsename, dynamic profilePicture, dynamic birth,
      dynamic robe, dynamic sexe, dynamic speciality) async {
    var db = await Db.create(MONGO_URL);
    Random random = new Random();
    int randomNumber = random.nextInt(10000);
    await db.open();
    await db.collection(COLLECTION_HORSE).insertOne(<String, dynamic>{
      "horsename": horsename,
      "profilePicture": profilePicture,
      "birth": birth,
      "robe": robe,
      "sexe": sexe,
      "speciality": speciality,
      "horse_id": randomNumber,
      "id": "",
      "DP": ""
    });
  }

  static getSpecificListData(
      dynamic dataWanted, dynamic selectedCollection) async {
    var db = await Db.create(MONGO_URL);
    ActualList.clear();

    var collection = db.collection(selectedCollection);
    await db.open();
    var data = (await collection
        .findOne(where.eq(dataWanted, "100"))); //For test is 100.
    for (var item in data!.values) {
      if (!item.toString().contains("Object", 0)) {
        ActualList.add(item);
      }
      loopNumber++;
    }
  }

  static Future<int> getNumberOfElement(
      dynamic dataWanted, dynamic selectedCollection) async {
    var db = await Db.create(MONGO_URL);
    ActualList.clear();
    var collection = db.collection(selectedCollection);
    await db.open();
    var mail = (await collection
        .findOne(where.eq(dataWanted, "100"))); //For test is 100.
    for (var item in mail!.values) {
      ActualList.add(item);
      print(ActualList[item]);
    }

    return 10;
  }

  static logging(dynamic dataWanted, dynamic enterMailOrNumberField,
      dynamic enterPassword, dynamic selectedCollection) async {
    var db = await Db.create(MONGO_URL);
    var list = [];
    var collection = db.collection(selectedCollection);
    await db.open();
    var mail = (await collection
        .findOne(where.eq(dataWanted, enterMailOrNumberField)));
    for (var item in mail!.values) {
      list.add(item);
    }
    OnlineUser = ActualUser(
        list[1], list[2], list[3], list[4], "accountFFE", 0, list[5], 0);

    if (mail.length != 0) {
      if (enterMailOrNumberField == OnlineUser.password) {
        ifUserOnline = true;
      }
    } else {
      ifUserOnline = false;
    }
  }

  /*static updateData(dynamic selectedDataInCollection, dynamic selectedCollection,
  dynamic modifyUserName, dynamic modifymail) async {
    //Ouvre le link DATA
    var db = await Db.create(MONGO_URL);
    await db.open();
    //Enregistre OLD user et modifier le OnlineUser (Pour simplifier la méthode)
    var OldUser =  OnlineUser;
    OnlineUser = ActualUser(modifyUserName.toString(), modifymail.toString(), password, profilePicture, accountFFE, phoneNumber, OldUser.id, birth)
    //Changement des valeurs dans la BDD
    var collection = db.collection(selectedCollection); // Aka users
    await collection.update(where.eq(selectedDataInCollection, OnlineUser.id),  // SelectedDataInCollection = id
        modify.set(dataWanted, dataModified)); //Faire les data à changer
  }
   */

  void deleteData(dynamic dataWanted, dynamic dataSelected,
      dynamic selectedCollection) async {
    var db = connect();
    var collection = db.collection(selectedCollection);
    await collection.remove(where.eq(dataWanted, dataSelected));
  }
}

class ActualUser {
  final String username;
  final String mail;
  final String password;
  final String profilePicture;
  final String accountFFE;
  final int phoneNumber;
  final int id;
  final int birth;

  ActualUser(this.username, this.mail, this.password, this.profilePicture,
      this.accountFFE, this.phoneNumber, this.id, this.birth);
}
