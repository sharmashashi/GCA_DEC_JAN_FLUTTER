import 'package:flutter/material.dart';

class MySettingsTile extends StatelessWidget {
  final IconData iconData;
  final Color iconBackgroundColor;
  final String title, subtitle;
  final double tileWidth, tileHeight;
  MySettingsTile(
      {@required this.tileWidth,
      @required this.tileHeight,
      @required this.title,
      @required this.subtitle,
      @required this.iconData,
      @required this.iconBackgroundColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      width: tileWidth,
      height: tileHeight,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0.5,
            blurRadius: 0.8,
            offset: Offset(1, 1))
      ]),
      child: Padding(
        padding:  EdgeInsets.only(left: 20),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _myIcon(),
            SizedBox(
              width: 15,
            ),
            _settingsMenu()
          ],
        ),
      ),
    );
  }

  Widget _myIcon() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration:
          BoxDecoration(color: iconBackgroundColor, shape: BoxShape.circle),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }

  Widget _settingsMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade600),
        )
      ],
    );
  }
}
