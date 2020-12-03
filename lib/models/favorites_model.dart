import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtual_app/datas/product_data.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoritesModel extends Model {
  UserModel user;
  bool isLoading = false;
  List<ProductData> favoriteProduct = [];

  FavoritesModel(this.user) {
    if (user.isLoggedIn()) {
      _loadFavoritesItems();
    }
  }

  //Adiconar um item aos favoritos
  void addFavoritesItem(ProductData productData) {
    ///Adicionar a lista local no dispositivo
    favoriteProduct.add(productData);

    ///Adcionar a lista do firebase
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("favorites")
        .add(productData.toFavoritesMap())
        .then((doc) {
      productData.id = doc.documentID;
    });

    notifyListeners();
  }

  //Removerum item aos favoritos
  void removeCartItem(ProductData productData) {
    ///Adcionar a lista do firebase
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("favorites")
        .document(productData.id)
        .delete();

    ///Remover a lista local no dispositivo
    favoriteProduct.remove(productData);

    notifyListeners();
  }

  ///Carregar os itens que usuário marcou como favorito
  void _loadFavoritesItems() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("favorites")
        .getDocuments();
    favoriteProduct =
        query.documents.map((doc) => ProductData.fromDocument(doc)).toList();

    notifyListeners();
  }
}
