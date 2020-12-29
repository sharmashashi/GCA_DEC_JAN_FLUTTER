import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttergca/screens/homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      if (firebaseAuth.currentUser != null) {
        Get.off(Home());
      } else {}
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_googleSigninButton()],
      ),
    );
  }

  Widget _googleSigninButton() {
    return RaisedButton(
      onPressed: () {
        _gSignin();
      },
      child: Text("Signin with Google"),
    );
  }

  _gSignin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    GoogleSignInAccount signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication authentication =
        await signInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);
    Get.off(Home());
  }
}
