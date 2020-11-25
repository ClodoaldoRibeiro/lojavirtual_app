import 'package:flutter/material.dart';
import 'package:lojavirtual_app/models/cart_model.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:lojavirtual_app/screens/welcome_screen.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/tiles/cart_tile.dart';
import 'package:lojavirtual_app/widgets/default_button.dart';
import 'package:scoped_model/scoped_model.dart';

// Classe de Screen de meu Carrinho
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                return Text(
                  "${p ?? 0} ${p == 1 ? "Item" : "Itens"}",
                  style: TextStyle(fontSize: 17.0),
                );
              },
            ),
          ),
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn()) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!UserModel.of(context).isLoggedIn()) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 80.0,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Faça login para adicionar produtos",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  DefaultButton(
                    text: "Entrar",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ));
                    },
                  ),
                ],
              ),
            );
          } else if (model.products == null || model.products.length == 0) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80.0,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Carrinho vazio!",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            return ListView(
              children: <Widget>[
                Column(
                  children: model.products.map(
                          (product){
                        return CartTile(product);
                      }
                  ).toList(),
                ),
              ],
            );
          }
          //Apenas para não acusar o erro.
          return Center();
        },
      ),
    );
  }
}
