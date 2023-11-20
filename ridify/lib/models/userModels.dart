import 'package:firebase_database/firebase_database.dart';
class UserModel{
  String ? phone;
  String ? name;
  String? id;
  String? email;

  UserModel({
    this.phone,
    this.email,
    this.id,
    this.name,

  });
  UserModel.fromSnapshot(DataSnapshot snap){
    phone = (snap.value as dynamic)["phone"];
    email = (snap.value as dynamic)["email"];
    id = snap.key;
    name = (snap.value as dynamic)["name"];



  } 
}