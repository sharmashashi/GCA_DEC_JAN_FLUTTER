import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_myWifiIcon()],
        title: Text("First page"),
      ),
      body: Column(
        children: [
          // CircularProgressIndicator(),
          RaisedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return SecondPage();
              //   },
              // ));

              Navigator.pushNamed(context, "/secondPage");
            },
            child: Text("Go to 2nd page"),
          ),
          RaisedButton(
            onPressed: () async {
              await Navigator.pushNamed(context, "/thirdPage");
              await Future.delayed(Duration(seconds: 5));
              _displayDialog(context);
            },
            child: Text("Go to 3rd page"),
          ),
          

          // _sliderbutton(context)
        ],
      ),
    );
  }

  Widget _sliderbutton(BuildContext context) {
    return SliderButton(
      action: () {
        _displayDialog(context);
      },
      icon: Text("Hi"),
    );
  }

  void _displayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            title: Text("Simple Dialog"),
          );
        });
  }

  Widget _myWifiIcon() {
    return ImageIcon(
      AssetImage("assets/wifi.png"),
      color: Colors.white,
    );
  }
}
