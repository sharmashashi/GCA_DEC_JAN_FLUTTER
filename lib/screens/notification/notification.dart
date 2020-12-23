import 'dart:math';

import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Expanded(
            child: Container(
          color: Colors.purple,
        )),
        Flexible(
          child: Ink(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.rotate(angle: 2*pi/3, child: Text("Hi, Good Eveing!")),
                  Transform.scale(scale: 1.5, child: Text("Hi, Good Eveing!")),
                  Transform.translate(
                      offset: Offset(-50, -70), child: Text("Hi, Good Eveing!"))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
