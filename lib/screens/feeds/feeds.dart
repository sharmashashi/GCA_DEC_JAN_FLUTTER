import 'package:flutter/material.dart';
import 'package:fluttergca/screens/custom_card/customcard.dart';
import 'package:fluttergca/screens/feeds/feedsController.dart';
import 'package:get/get.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext ctx, Orientation orientation) {
      print(orientation);
      return GetBuilder(
        init: FeedsController(),
        builder: (FeedsController controller) => Scaffold(
          backgroundColor: Colors.blueGrey.shade300,
          // appBar: AppBar(
          //   backgroundColor: Colors.indigo.shade700,
          //   actions: [_refreshButton(controller)],
          //   title: Text("News Feed"),
          // ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    orientation == Orientation.portrait ? 0 : Get.width * .1),
            child: RefreshIndicator(
                onRefresh: () {
                  return controller.refresh();
                },
                child: ListView(
                  children: controller.cards,
                  physics: BouncingScrollPhysics(),
                )),
          ),
        ),
      );
    });
  }

  Widget _refreshButton(FeedsController controller) {
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {
        controller.refresh();
      },
    );
  }
}
