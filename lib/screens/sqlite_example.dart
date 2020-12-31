import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SqliteExample extends StatefulWidget {
  @override
  _SqliteExampleState createState() => _SqliteExampleState();
}

class _SqliteExampleState extends State<SqliteExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sqflite example"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _insertBtn(),
        _readBtn(),
        _updateBtn(),
        _deleteBtn(),
      ],
    );
  }

  Widget _insertBtn() {
    return MaterialButton(
      onPressed: () {
        _insert();
      },
      child: Text("insert"),
      color: Colors.green,
    );
  }

  _insert() async {
    Database database = await _openDb();
    Map<String, dynamic> userData = {
      "id": 1,
      "firstname": "John",
      "lastname": "Doe"
    };
    await database.insert("user", userData);
  }

  Widget _readBtn() {
    return MaterialButton(
      onPressed: () async {
        Database database = await _openDb();
        List result = await database.query("user");
        print(result);
      },
      child: Text("read"),
      color: Colors.green,
    );
  }

  Widget _updateBtn() {
    return MaterialButton(
      onPressed: () async {
        Database database = await _openDb();
        await database.update("user", {"id": 2}, where: 'id=?', whereArgs: [1]);
      },
      child: Text("update"),
      color: Colors.green,
    );
  }

  Widget _deleteBtn() {
    return MaterialButton(
      onPressed: () async {
        Database database = await _openDb();
        database.delete("user", where: "id=?", whereArgs: [2]);
      },
      child: Text("delete"),
      color: Colors.green,
    );
  }

  Future<Database> _openDb() async {
    return openDatabase(await getDatabasesPath() + "/my_db.db");
  }
}
