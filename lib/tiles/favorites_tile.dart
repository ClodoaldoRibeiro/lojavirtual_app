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
                    return Container(
                      height: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: 0.90,
                            child: Image.network(
                              snapshot.data["images"][0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data["title"]}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text(
                                    "R\$ ${snapshot.data["price"].toStringAsFixed(2)}",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.favorite_outlined,
                                    color: Theme.of(context).primaryColor),
                                onPressed: () {},
                              )),
                        ],
                      ),
                    );
                  }
                })));
  }
}
