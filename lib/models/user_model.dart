import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String? id;
  late String? email;
  late String? userType;
  late String? phoneNumber;
  UserModel({this.id, this.email, this.userType, this.phoneNumber});
  UserModel.fromDoucmentSnapshot(
      DocumentSnapshot doc, String uType, String phNumber) {
    id = doc.id;
    email = doc["email"];
    phoneNumber = phNumber;
    userType = uType;
  }
}
