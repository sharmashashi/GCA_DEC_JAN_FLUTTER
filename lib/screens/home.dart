import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String changeValue = "Initial";
  String gesture = "no gesture provided yet";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                handleGesture("on tap called");
              },
              onLongPress: () {
                handleGesture("on long press called");
              },
              onDoubleTap: () {
                handleGesture("on double tap called");
              },
              child: Text("Provide gesture here"),
            ),
            RaisedButton(
              onPressed: () {
                changeValue = "Changed";

                print(changeValue);
                setState(() {});
              },
              child: Text("Click Me"),
            ),
            Row(
              children: [
                Text(
                  "Gesture Statue: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(gesture)
              ],
            )
          ],
        ));
  }

  void handleGesture(String providedGesture) {
    setState(() {
      gesture = providedGesture;
    });
  }
}

class MyStatelessWidget extends StatelessWidget {
  String changeValue = "Initial";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(changeValue),
            RaisedButton(
              onPressed: () {
                changeValue = "Changed";
                print(changeValue);
              },
              child: Text("Click Me"),
            )
          ],
        ));
  }
}
