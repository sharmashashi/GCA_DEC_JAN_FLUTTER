import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttergca/screens/homepage.dart';
import 'package:fluttergca/screens/signup/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
        children: [
          _signinForm(),
          _googleSigninButton(),
          Divider(),
          _signupButton()
        ],
      ),
    );
  }

  Widget _signinForm() {
    return Container(
      child: Column(
        children: [
          _field(controller: emailController, hintText: "Email"),
          _field(controller: passwordController, hintText: "Password"),
          _signinButton()
        ],
      ),
    );
  }

  Widget _signinButton() {
    return MaterialButton(
      color: Colors.blue,
      onPressed: () {
        _signin();
      },
      child: Text("Sign In", style: TextStyle(color: Colors.white)),
    );
  }

  _signin() async {
    _showProgressDialog();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.off(Home());
    } catch (e) {
      if (Get.isDialogOpen) Get.back();
      _showErrorDialog();
    }
  }

  Widget _field({TextEditingController controller, String hintText}) {
    InputBorder border = OutlineInputBorder();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: border,
            focusedBorder: border,
            isDense: true),
      ),
    );
  }

  _showErrorDialog() {
    Get.dialog(AlertDialog(
      content: Text("Error while loging in"),
    ));
  }

  _showProgressDialog() {
    Get.dialog(AlertDialog(
      content: Row(
        children: [
          Text("Please wait"),
          SizedBox(
            width: 20,
          ),
          CircularProgressIndicator()
        ],
      ),
    ));
  }

  Widget _signupButton() {
    return RaisedButton(
      onPressed: () {
        Get.to(Signup());
      },
      child: Text(
        "Signup",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.green,
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
