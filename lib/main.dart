import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergca/screens/firstpage.dart';
import 'package:fluttergca/screens/networkcall.dart';
import 'package:fluttergca/screens/secondpage.dart';
import 'package:fluttergca/screens/thirdpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("");
    return MaterialApp(
      routes: {
        "/secondPage": (context) => SecondPage(),
        "/thirdPage": (context) => ThirdPage(),
        "/firstPage": (context) => FirstPage(),
      },
      debugShowCheckedModeBanner: false,
      home: SimpleNetworkCall(),
    );
  }
}
