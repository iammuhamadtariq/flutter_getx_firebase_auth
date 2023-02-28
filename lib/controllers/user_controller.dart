import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_auth/models/user_model.dart';

class UserModelController extends GetxController {
  final FirebaseFirestore _firestoreUserInformation =
      FirebaseFirestore.instance;

  final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
  static UserModelController userModelInstance = Get.find();
  late Rx<UserModel?> firebaseUserModel;

  Future<void> addUserRecord(UserModel userModel) async {
    try {
      await _firestoreUserInformation.collection('userInformation').add({
        'email': userModel.email,
        'phoneNumber': userModel.phoneNumber,
      });
    } catch (e) {
      print(e);
    }
  }
}
