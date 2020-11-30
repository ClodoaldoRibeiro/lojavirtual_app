import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:lojavirtual_app/tiles/favorites_tile.dart';
import 'package:lojavirtual_app/widgets/required_user.dart';

class FavoritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UserModel.of(context).isLoggedIn()) {
      String uid = UserModel.of(context).firebaseUser.uid;

      //Recupera os dados do usuário
      return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("users")
            .document(uid)
            .collection("favorites")
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data.documents
                  .map((doc) => FavoritesTile(doc))
                  .toList()
                  .reversed
                  .toList(),
            );
          }
        },
      );
    } else {
      return RequiredUser();
    }
  }
}
