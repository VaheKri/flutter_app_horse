import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constantMango.dart';
import 'dart:math';

class MangoDatabase {
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

  static registerHorse(dynamic username, dynamic password, dynamic mail,
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

  static mapUserToTable(dynamic username) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
  }

  static late ActualUser OnlineUser;
  static  bool ifUserOnline =false;

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
      ifUserOnline=false;
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
