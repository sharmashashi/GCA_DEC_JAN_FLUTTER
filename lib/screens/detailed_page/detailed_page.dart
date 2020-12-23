import 'package:flutter/material.dart';
import 'package:fluttergca/models/feedmodel.dart';
import 'package:fluttergca/screens/custom_card/customcard.dart';

class DetailedPage extends StatelessWidget {
  final FeedModel feedModel;
  DetailedPage(this.feedModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(feedModel.pagename),
        backgroundColor: Colors.indigo.shade700,
      ),
      body: CustomCard(feedModel),
      backgroundColor: Colors.white,
    );
  }
}
