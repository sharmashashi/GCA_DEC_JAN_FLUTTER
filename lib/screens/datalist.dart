import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> counts = ["0", "1", "2"];
  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.amber,
      child: SizedBox(
          width: Get.width,
          height: Get.height * .5,
          child: StreamBuilder(
            stream: firestore.collection("users").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              List<QueryDocumentSnapshot> qdocsnap = snapshot.data.docs;
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: qdocsnap.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        Divider(),
                        Text(qdocsnap[index].data().toString()),
                      ],
                    );
                  },
                );
              }
              return SizedBox();
            },
          )),
    );
  }
}
