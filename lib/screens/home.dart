import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Icon(
              Icons.phone,
              color: Colors.white,
            ),
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.video_call,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            )
          ],
          title: Text("This is title"),
        ),
        body: Column(
          children: [
            Container(height: 50, width: 100, color: Colors.purple),
            SizedBox(
              height: 20,
            ),
            Container(height: 50, width: 100, color: Colors.green),
            SizedBox(
              height: 20,
            ),
            Container(height: 50, width: 100, color: Colors.purple),
            Text(
              "This is text",
              style: TextStyle(color: Colors.red),
            ),
            TextField(),
            RaisedButton(
              elevation: 5,
              color: Colors.amber,
              onPressed: () {},
              child: Text("Raised button"),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("Flat Button"),
              color: Colors.red,
            ),
            Image.network(
              "https://course.genesecloud.academy/pluginfile.php?file=%2F1%2Ftheme_alpha%2Fcustomlogotopbar%2F1606229507%2Fsmall-icon.png",
              height: 50,
              width: 50,
            ),
            Container(
              color: Colors.transparent,
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Container(height: 200, width: 200, color: Colors.purple),
                  Container(height: 150, width: 150, color: Colors.green),
                  Text("I am at top"),
                ],
              ),
            ),
            Container(
                height: 50, width: 50, color: Color.fromRGBO(255, 0, 0, 0.5))
          ],
        ));
  }
}
