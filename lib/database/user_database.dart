import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_firebase_auth/models/user_model.dart';

class UserDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("userInformatoin").add({
        "id": user.id,
        "email": user.email,
        "userType": user.userType,
        "phoneNuber": user.phoneNumber,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String userEmail) async {
    try {
      await _firestore.collection("userInformation").doc(userEmail).get();
      
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
