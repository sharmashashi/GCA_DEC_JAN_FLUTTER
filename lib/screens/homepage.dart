import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttergca/screens/signin/signin.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [_signoutButton()],
      ),
    );
  }

  Widget _signoutButton() {
    return IconButton(
      icon: Icon(
        Icons.power_settings_new,
        color: Colors.red,
      ),
      onPressed: () {
        _signout();
      },
    );
  }

  _signout() async {
    await FirebaseAuth.instance.signOut();
    Get.off(Signin());
  }
}
