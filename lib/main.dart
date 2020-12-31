import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergca/screens/home.dart';
import 'package:fluttergca/screens/sqlite_example.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, systemNavigationBarColor: Colors.blue));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _createDatabase();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SqliteExample(),
    );
  }

  _createDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseFileName = "my_db.db";
    int databaseVersion = 1;
    openDatabase(databasePath + "/" + databaseFileName,
        version: databaseVersion, onCreate: (db, version) {
      String createTableQuery =
          "CREATE TABLE user(id INTEGER,firstname TEXT,lastname TEXT)";
      db.execute(createTableQuery);
    }, onUpgrade: (db, oldV, newV) {});
  }
}
