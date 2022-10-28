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

  static registerHose(dynamic nameHorse, dynamic race, dynamic age,
      dynamic robe, dynamic url, dynamic spe, dynamic sexe, dynamic idProprio) async {
    var db = await Db.create(MONGO_URL);
    Random random = new Random();
    int randomNumber = random.nextInt(10000);
    await db.open();
    await db.collection('horses').insertOne(<String, dynamic>{
      'nameHorse': nameHorse,
      'race': race,
      'age': age,
      "robe": robe,
      "url": url,
      "spe": spe,
      "sexe": sexe,
      "id": randomNumber,
      "idProprio": idProprio

    });}

  Future<List> getEvent() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var _eventPoney = await db.collection('event');
    var _eventData =  await _eventPoney.find().toList();
    return _eventData;

  }

  static updateDataform(dynamic selectedData, dynamic selectedCollection,
      dynamic modifyUserName, dynamic modifymail, dynamic accountFFE,
      dynamic profilePicture, dynamic age, dynamic phoneNumber) async {
    //Ouvre le link DATA
    var db = await Db.create(MONGO_URL);
    await db.open();

    //Enregistre OLD user et modifier le OnlineUser (Pour simplifier la méthode)
    var OldUser = OnlineUser;


    OnlineUser = ActualUser(
        modifyUserName.toString(),
        modifymail.toString(),
        OldUser.password,
        profilePicture,
        accountFFE,
        0,
        OldUser.id,
        0);

    //Changement des valeurs dans la BDD
    var collection = db.collection(selectedCollection); // Aka users
    await collection.update(where.eq(selectedData, OnlineUser.id),
        // SelectedDataInCollection = id
        modify.set("username", modifyUserName).set("email", modifymail).set(
            "ffe", accountFFE).set("profilePicture", profilePicture).set(
            "age", age).set("phoneNumber", phoneNumber));
    print(modifyUserName); //Faire les data à changer
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
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(selectedCollection);
    await collection.remove(where.eq(dataWanted,dataSelected));
  }

  static delete(dynamic dataWanted,dynamic selectedCollection) async{
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(selectedCollection);
    await collection.deleteOne(dataWanted);
  }
  static late ActualUser OnlineUser;
  static bool ifUserOnline = false;

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
        list[1],
        list[2],
        list[3],
        list[4],
        "accountFFE",
        0,
        list[5],
        0);


    if (mail?.length != 0) {
      if (enterMailOrNumberField == OnlineUser.password) {
        ifUserOnline = true;
      }
    } else {
      ifUserOnline = false;
    }
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