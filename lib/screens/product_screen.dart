import 'package:flutter/material.dart';
import 'package:lojavirtual_app/datas/product_data.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductScreen extends StatefulWidget {
  final ProductData productData;

  ProductScreen(this.productData);

  @override
  _ProductScreenState createState() => _ProductScreenState(productData);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData productData;

  _ProductScreenState(this.productData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title, style: headingStyle),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.90,
            child: Carousel(
              images: productData.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 6.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: kPrimaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(productData.title,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    maxLines: 3),
                Text(
                  "R\$ ${productData.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
