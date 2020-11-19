import 'package:flutter/material.dart';
import 'package:lojavirtual_app/datas/product_data.dart';
import 'package:lojavirtual_app/screens/product_screen.dart';

class ProductTileList extends StatelessWidget {
  final ProductData product;

  ProductTileList(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductScreen(product)));
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.network(
                product.images[0],
                fit: BoxFit.cover,
                height: 250.0,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.title,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Apenas:",
                      style: TextStyle(
                        fontSize: 8.5,
                      ),
                    ),
                    Text(
                      "R\$ ${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_outline),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
