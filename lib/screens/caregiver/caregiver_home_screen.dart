// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:getx_firebase_auth/controllers/auth_controller.dart';

class CaregiverHomeScreen extends StatelessWidget {
  final String? email;
  const CaregiverHomeScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthController.authInstance.signOut();
            },
            icon: Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text("this is caregiver home screen"),
            Text(email ?? '${email}'),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
