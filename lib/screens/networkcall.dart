import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SimpleNetworkCall extends StatefulWidget {
  @override
  _SimpleNetworkCallState createState() => _SimpleNetworkCallState();
}

class _SimpleNetworkCallState extends State<SimpleNetworkCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Netwok Call"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () {
                _fetchFromBackend();
              },
              child: Text("Fetch data from backend"),
            )
          ],
        ),
      ),
    );
  }

  void _fetchFromBackend() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    Response res = await get(url);
    print(res.body);
  }
}
