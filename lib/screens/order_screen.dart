import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/constants.dart';

class OrderScreen extends StatelessWidget {
  final String orderId;

  OrderScreen(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedido Realizado", style: headingStyle),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
              size: 150.0,
            ),
            Text(
              "Pedido realizado com sucesso!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
            ),
            SizedBox(
              height: 7.0,
            ),
            Text(
              "Pedido: $orderId",
              style: TextStyle(fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
