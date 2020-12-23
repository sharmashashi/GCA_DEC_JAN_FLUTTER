import 'package:flutter/material.dart';
import 'package:fluttergca/screens/feeds/feeds.dart';

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Facebook "),
          bottom: TabBar(
            isScrollable: false,
            tabs: [_feedTab(), _notificationTab()],
          ),
        ),
        body: TabBarView(
          children: [Feeds(), Container()],
        ),

        
      ),
    );
  }

  Widget _feedTab() {
    return Icon(
      Icons.chrome_reader_mode,
      color: Colors.white,
    );
  }

  Widget _notificationTab() {
    return Icon(
      Icons.notifications,
      color: Colors.white,
    );
  }
}
