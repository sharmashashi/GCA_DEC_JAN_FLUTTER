import 'package:flutter/material.dart';
import 'package:fluttergca/screens/multiplewidgets.dart';

class MyCounter extends StatefulWidget {
  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _counterValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _actionButtons(),
      appBar: _appBar(),
      body: _body(),
      endDrawer: _drawer(),
      bottomSheet: Container(
        height: 100,
        width: 200,
        color: Colors.blue,
      ),
      drawer: _drawer(),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: MultipleWidget(),
    );
  }

  Widget _body() {
    return Center(
        child: Ink(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('You have pressed button this many times'),
          Text('$_counterValue')
        ],
      ),
    ));
  }

  Widget _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Counter"),
    );
  }

  Widget _actionButtons() {
    return Ink(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _button(() {
            _increment();
          },
              Icon(
                Icons.add,
                size: 30,
                color: Colors.green,
              )),
          SizedBox(
            width: 20,
          ),
          _button(() {
            _decrement();
          },
              Text(
                "-",
                style: TextStyle(color: Colors.red, fontSize: 40),
              ))
        ],
      ),
    );
  }

  Widget _button(Function onPressed, Widget child) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: child,
      backgroundColor: Colors.white,
    );
  }

  _increment() {
    setState(() {
      _counterValue++;
    });
  }

  _decrement() {
    setState(() {
      _counterValue--;
    });
  }
}
