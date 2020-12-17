import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Second page"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {},
            child: Text("Go to 1st page"),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Go to 3rd page"),
          )
        ],
      ),
    );
  }
}
