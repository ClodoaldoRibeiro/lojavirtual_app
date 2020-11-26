import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtual_app/datas/cart_product.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class CartModel extends Model {
  UserModel user;
  bool isLoading = false;

  List<CartProduct> products = [];
  String couponCode;
  int discountPercentage = 0;

  static CartModel of(BuildContext context) {
    return ScopedModel.of<CartModel>(context);
  }

  CartModel(this.user) {
    if (user.isLoggedIn()) {
      _loadCartItems();
    }
  }

  //Adiconar um item ao carrinho
  void addCartItem(CartProduct cartProduct) {
    products.add(cartProduct);

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .add(cartProduct.toMap())
        .then((doc) {
      cartProduct.cid = doc.documentID;
    });

    notifyListeners();
  }

  //Remover itens do Carrinho
  void removeCartItem(CartProduct cartProduct) {
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cid)
        .delete();

    products.remove(cartProduct);

    notifyListeners();
  }

  //Adicionar mais um item ao carrinho
  void decProduct(CartProduct cartProduct) {
    cartProduct.quantity--;

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }

//Remover mais um item ao carrinho
  void incProduct(CartProduct cartProduct) {
    cartProduct.quantity++;

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }

  void _loadCartItems() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .getDocuments();

    products =
        query.documents.map((doc) => CartProduct.fromDocument(doc)).toList();

    notifyListeners();
  }

  void setCoupon(String couponCode, int discountPercentage) {
    this.couponCode = couponCode;
    this.discountPercentage = discountPercentage;
  }

  void updatePrices() {
    notifyListeners();
  }

  double getProductsPrice() {
    double price = 0.0;
    for (CartProduct c in products) {
      if (c.productData != null) price += c.quantity * c.productData.price;
    }
    return price;
  }

  double getDiscount() {
    return getProductsPrice() * discountPercentage / 100;
  }

  double getShipPrice() {
    return 9.99;
  }

  double getTotal() {
    double price = getProductsPrice();
    double discount = getDiscount();
    double ship = getShipPrice();

    return (price + ship) - discount;
  }
}
