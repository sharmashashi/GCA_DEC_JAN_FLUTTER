import 'package:flutter/material.dart';
import 'package:fluttergca/screens/feeds/feeds.dart';
import 'package:fluttergca/screens/notification/notification.dart';

class BottomNavView extends StatefulWidget {
  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int _currentIndex = 0;
  List<Widget> pages = [Feeds(), NotificationsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _myBottomNavBar(),
      body: pages[_currentIndex],
    );
  }

  Widget _myBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.blue.shade700,
      onTap: (index) {
        _currentIndex = index;
        setState(() {});
      },
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
            title: Text("News feeds"),
            icon: Icon(
              Icons.chrome_reader_mode,
            )),
        BottomNavigationBarItem(
            title: Text("Notifications"), icon: Icon(Icons.notifications))
      ],
    );
  }
}
