import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_auth/controllers/auth_controller.dart';

import 'package:getx_firebase_auth/screens/signup/signup.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                AuthController.authInstance.signin(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
            ),
            const SizedBox(height: 40),
            TextButton(
              child: const Text("Signup"),
              onPressed: () {
                Get.to(() => SignupScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
