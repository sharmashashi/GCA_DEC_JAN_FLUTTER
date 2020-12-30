import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _configureFcm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            elevation: 4,
            color: Colors.white,
            onPressed: () {
              _sendNotification();
            },
            child: Text("Send test notification"),
          )
        ],
      ),
    )));
  }

  _sendNotification() async {
    await Future.delayed(Duration(seconds: 5));
    String serverToken =
        "AAAAFmJQQLA:APA91bHaCvXwdTApcA4HSqAR3OUrIwAOJu0IHEU0h5gGYPsZakOsVifqkAhHSBHdAY_OTpj-ofX0ohso5LICyZxczHWnELzz8qy5Yqv-yWr3kTAHgaV28MF7wEeA5n5bKhE_qMKy9Dqw";
    FirebaseMessaging fcm = FirebaseMessaging();
    String url = 'https://fcm.googleapis.com/fcm/send';

    Map<String, String> header = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverToken',
    };

    await post(
      url,
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': 'this is a body',
            'title': 'this is a title'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': await fcm.getToken(),
        },
      ),
    );
  }

  _configureFcm() async {
    FirebaseMessaging fcm = FirebaseMessaging();
    String deviceToken = await fcm.getToken();
    print(deviceToken);

    fcm.configure(onMessage: (message) {
      _handleOnMessage(message);
    }, onResume: (message) {
      print(message);
    });
  }

  _handleOnMessage(Map message) {
    Get.dialog(AlertDialog(
        title: Text(message['notification']['title']),
        content: Text(message.toString())));
  }
}
