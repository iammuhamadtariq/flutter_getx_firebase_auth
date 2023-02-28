import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_auth/controllers/auth_controller.dart';
import 'package:getx_firebase_auth/screens/login/login.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userTypeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  CollectionReference users =
      FirebaseFirestore.instance.collection('userInformation');

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    return await users
        .add({
          "email": emailController.text.trim().toString(),
          "phoneNumber": phoneNumberController.text.trim().toString(),
          "userType": userTypeController.text.trim().toString(),
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "email"),
                controller: emailController,
              ),
              const SizedBox(height: 40),
              TextFormField(
                decoration: const InputDecoration(hintText: "password"),
                obscureText: true,
                controller: passwordController,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "user type"),
                obscureText: true,
                controller: userTypeController,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "phone number"),
                obscureText: true,
                controller: phoneNumberController,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                child: const Text("Signup"),
                onPressed: () {
                  AuthController.authInstance.register(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                  addUser();
                },
              ),
              const SizedBox(height: 40),
              TextButton(
                child: const Text("Go back to login screen"),
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
