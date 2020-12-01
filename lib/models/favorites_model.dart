import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual_app/datas/product_data.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoritesModel extends Model{
  UserModel user;
  bool isLoading = false;
  List<ProductData> products = [];

  FavoritesModel(this.user) {
    if (user.isLoggedIn()) {
     _loadFavoritesItems();
    }
  }

  //Adiconar um item ao carrinho
  void addFavoritesItem(ProductData productData) {
    products.add(productData);

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("favorites")
        .add(productData.toResumedMap())
        .then((doc) {
      productData.id = doc.documentID;
    });

    notifyListeners();
  }

  void _loadFavoritesItems() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("favorites")
        .getDocuments();
    products =
        query.documents.map((doc) => ProductData.fromDocument(doc)).toList();

    notifyListeners();
  }

}