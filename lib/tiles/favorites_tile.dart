import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual_app/models/user_model.dart';

class FavoritesTile extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  FavoritesTile(this.documentSnapshot);

  @override
  Widget build(BuildContext context) {
    String pid = documentSnapshot["pid"];
    String cid = documentSnapshot["cid"];

    return Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: StreamBuilder<DocumentSnapshot>(
                stream: Firestore.instance
                    .collection("products")
                    .document(cid)
                    .collection("items")
                    .document(pid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${snapshot.data.documentID}",
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ],
                    );
                  }
                })));
  }
}
