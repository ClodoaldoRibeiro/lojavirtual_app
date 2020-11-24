import 'package:flutter/material.dart';
import 'package:lojavirtual_app/models/cart_model.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu carrinho", style: headingStyle),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8.0),
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                int p = model.products.length;
                return Text("${p ?? 0} ${p==1 ? "Item": "Itens"}", style: TextStyle(fontSize: 17.0),);
              },
            ),
          ),
        ],
      ),
    );
  }
}
