import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttergca/screens/datalist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fetchedData = "empty";
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController _fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [_createBtn(), _readBtn(), _deleteBtn()],
            ),
            Text(fetchedData),
            _textField(),
            _updateBtn(),
            DataList()
          ],
        ),
      ),
    );
  }

  Widget _deleteBtn() {
    return _btn(
        btnColor: Colors.red,
        onPressed: () {
          _delete();
        },
        btnName: "Delete");
  }

  Widget _updateBtn() {
    return _btn(
        onPressed: () {
          _update();
        },
        btnName: "Update");
  }

  Widget _textField() {
    return TextField(
      controller: _fieldController,
    );
  }

  Widget _readBtn() {
    return _btn(
        onPressed: () {
          _read();
        },
        btnName: "Read");
  }

  Widget _createBtn() {
    return _btn(
        onPressed: () {
          _create();
        },
        btnName: "Create");
  }

  Widget _btn(
      {@required Function onPressed,
      @required String btnName,
      Color btnColor}) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        btnName,
        style: TextStyle(color: Colors.white),
      ),
      color: btnColor ?? Colors.green,
    );
  }

  _create() async {
    Map<String, dynamic> data = {
      "email": "user@user.com",
      "phone": "98xxxxxxxx",
      "age": 30,
      "address": "Kathmandu"
    };

    await firestore
        .collection("users")
        .doc(DateTime.now().toIso8601String())
        .set(data);
  }

  _read() async {
    DocumentSnapshot docSnap =
        await firestore.collection("users").doc("1").get();

    fetchedData = docSnap.data().toString();
    setState(() {});

    // QuerySnapshot qsnap = await firestore.collection("users").get();
    // List<QueryDocumentSnapshot> qdocsnaplist = qsnap.docs;

    // for (QueryDocumentSnapshot each in qdocsnaplist) {
    //   print(each.data());
    // }
  }

  _update() async {
    await firestore
        .collection("users")
        .doc("1")
        .update({"address": _fieldController.text});
    _fieldController.clear();
  }

  _delete() async {
    await firestore.collection("users").doc("1").delete();
  }
}
