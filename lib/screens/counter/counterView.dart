import 'package:flutter/material.dart';
import 'package:fluttergca/screens/counter/counterController.dart';
import 'package:get/get.dart';

class CounterApp extends StatelessWidget {
  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        actions: [_getScreenSize()],
      ),
      floatingActionButton: _floatingButton(),
      body: _body(),
    );
  }

  Widget _getScreenSize() {
    return IconButton(
      onPressed: () {
        Get.dialog(SimpleDialog(
          children: [
            Text("Screen Height: ${counterController.getScreenSize().height}"),
            Text("Screen Width: ${counterController.getScreenSize().width}")
          ],
        ));
      },
      icon: Icon(Icons.info),
    );
  }

  Widget _floatingButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        _btn(
          buttonColor: Colors.green,
          onPressed: () {
            counterController.incrementCounter();
          },
          icon: Icon(Icons.add),
        ),
        SizedBox(
          width: 15,
        ),
        _btn(
            onPressed: () {
              counterController.decrementCounter();
            },
            icon: Icon(Icons.remove),
            buttonColor: Colors.red)
      ],
    );
  }

  Widget _btn(
      {@required Function onPressed,
      @required Widget icon,
      @required Color buttonColor}) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: icon,
      backgroundColor: buttonColor,
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You have push the button this many times"),
          Obx(() => Text(counterController.counter.toString()))
        ],
      ),
    );
  }
}
