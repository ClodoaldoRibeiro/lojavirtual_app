import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual_app/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  CategoryTile(this.documentSnapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.black12,
        backgroundImage:
            NetworkImage(documentSnapshot.data["icon"], scale: 0.80),
      ),
      title: Text(documentSnapshot.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right_outlined),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryScreen(documentSnapshot)));
      },
    );
  }
}
