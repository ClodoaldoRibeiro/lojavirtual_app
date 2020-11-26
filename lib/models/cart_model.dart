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

  //Configura o cumpom de desconto
  void setCoupon(String couponCode, int discountPercentage) {
    this.couponCode = couponCode;
    this.discountPercentage = discountPercentage;
  }

  void updatePrices() {
    notifyListeners();
  }

  //recupera o valor total dos produtos
  double getProductsPrice() {
    double price = 0.0;
    for (CartProduct c in products) {
      if (c.productData != null) price += c.quantity * c.productData.price;
    }
    return price;
  }

  //recupera o valor do desconto
  double getDiscount() {
    return getProductsPrice() * discountPercentage / 100;
  }

  //Recupera o valor do preco do frete
  double getShipPrice() {
    return 9.99;
  }

  //Recupera o valot total do pedido
  double getTotal() {
    double price = getProductsPrice();
    double discount = getDiscount();
    double ship = getShipPrice();

    return (price + ship) - discount;
  }

  //lança um pedido no sistema
  Future<String> finishOrder() async {
    if (products.length == 0) return null;

    isLoading = true;
    notifyListeners();

    //Obter os valores do que está no carrinho
    double productsPrice = getProductsPrice();
    double shipPrice = getShipPrice();
    double discount = getDiscount();
    double totalPrice = getTotal();

    //Gerando o pedido no firebase
    DocumentReference refOrder =
        await Firestore.instance.collection("orders").add({
      "clientId": user.firebaseUser.uid,
      "products": products.map((cartProduct) => cartProduct.toMap()).toList(),
      "shipPrice": shipPrice,
      "productsPrice": productsPrice,
      "discount": discount,
      "totalPrice": totalPrice,
      "status": 1
    });

    //lançar a referência do pedido na conta do usuário
    await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("orders")
        .document(refOrder.documentID)
        .setData({"orderId": refOrder.documentID});

    //Recupera dos dados do carinho do usuário
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .getDocuments();

    //Deleta cada item do carrinho
    for (DocumentSnapshot doc in query.documents) {
      doc.reference.delete();
    }

    //Limpa os produtos localmente do carrinho
    products.clear();
    //Configura o cumpom de desconto como sendo null
    couponCode = null;
    //Configura o percentual de desconto como 0
    discountPercentage = 0;

    //Notifica o Status do pedido
    isLoading = false;
    notifyListeners();

    //Retorno o número do pedido
    return refOrder.documentID;
  }
}
