import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/tiles/category_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;

    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("products")
            .orderBy("title")
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            return ListView(
              padding: EdgeInsets.fromLTRB(0.0, 15, 8, 0.0),
              children: snapshot.data.documents.map((doc) {
                return CategoryTile(doc);
              }).toList(),
            );
          }
        });
  }
}
