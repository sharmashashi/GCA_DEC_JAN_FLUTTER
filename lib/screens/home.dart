import 'package:flutter/material.dart';
import 'package:fluttergca/screens/settings.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("root page"),
      ),
      body: Column(
        children: [
          IconButton(
            color: Colors.blue,
            onPressed: () async {
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(
                      appBarTitle: "Settings",
                    ),
                  ));
              print(result);
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
