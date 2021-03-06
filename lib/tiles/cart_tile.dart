import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual_app/datas/cart_product.dart';
import 'package:lojavirtual_app/datas/product_data.dart';
import 'package:lojavirtual_app/models/cart_model.dart';
import 'package:lojavirtual_app/settings/constants.dart';

class CartTile extends StatelessWidget {
  final CartProduct cartProduct;

  CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      CartModel.of(context).updatePrices();
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            width: 120.0,
            child: Image.network(
              cartProduct.productData.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cartProduct.productData.title,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17.0),
                ),
                Text(
                  "Tamanho: ${cartProduct.size}",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
                ),
                Text(
                  "Unitário R\$ ${cartProduct.productData.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove),
                      color: kPrimaryColor,
                      onPressed: cartProduct.quantity > 1
                          ? () {
                              CartModel.of(context).decProduct(cartProduct);
                            }
                          : null,
                    ),
                    Text(cartProduct.quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      color: kPrimaryColor,
                      onPressed: () {
                        CartModel.of(context).incProduct(cartProduct);
                      },
                    ),
                    FlatButton(
                      child: Icon(
                        Icons.delete_outline,
                        color: kPrimaryColor,
                      ),
                      textColor: Colors.grey[500],
                      onPressed: () {
                        CartModel.of(context).removeCartItem(cartProduct);
                      },
                    )
                  ],
                )
              ],
            ),
          )),
        ],
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: cartProduct.productData == null
          ? FutureBuilder<DocumentSnapshot>(
              future: Firestore.instance
                  .collection("products")
                  .document(cartProduct.category)
                  .collection("items")
                  .document(cartProduct.pid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  cartProduct.productData =
                      ProductData.fromDocument(snapshot.data);
                  return _buildContent();
                } else {
                  return Container(
                    height: 70.0,
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  );
                }
              },
            )
          : _buildContent(),
    );
  }
}
