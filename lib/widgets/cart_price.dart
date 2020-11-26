import 'package:flutter/material.dart';
import 'package:lojavirtual_app/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'default_button.dart';

class CartPrice extends StatelessWidget {
  final VoidCallback buy;

  CartPrice(this.buy);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: ScopedModelDescendant<CartModel>(
          builder: (context, child, model) {
            ///Obter dos valores de cada cateroria
            double price = model.getProductsPrice();
            double discount = model.getDiscount();
            double ship = model.getShipPrice();
            double total = model.getTotal();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Resumo do pedido",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Produtos"),
                    Text("R\$ ${price.toStringAsFixed(2)}")
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Desconto"),
                    Text("R\$ ${discount.toStringAsFixed(2)}")
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Entrega"),
                    Text("R\$ ${ship.toStringAsFixed(2)}")
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 14.0),
                    ),
                    Text(
                      "R\$ ${total.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                DefaultButton(
                  text: "Finalizar pedido",
                  press: buy,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
