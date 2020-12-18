import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergca/screens/detailedPage.dart';
import 'package:fluttergca/screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("");
    return MaterialApp(
      routes: {"/details": (context) => DetailedPage()},
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
