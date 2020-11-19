import 'package:lojavirtual_app/datas/cart_product.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  UserModel user;

  List<CartProduct> products = [];

  CartModel(this.user) {}
}
