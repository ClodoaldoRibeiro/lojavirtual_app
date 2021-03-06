import 'package:flutter/material.dart';
import 'package:lojavirtual_app/datas/cart_product.dart';
import 'package:lojavirtual_app/datas/product_data.dart';
import 'package:lojavirtual_app/models/cart_model.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:lojavirtual_app/screens/cart_screen.dart';
import 'package:lojavirtual_app/screens/welcome_screen.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/widgets/default_button.dart';

class ProductScreen extends StatefulWidget {
  final ProductData productData;

  ProductScreen(this.productData);

  @override
  _ProductScreenState createState() => _ProductScreenState(productData);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData productData;
  String size;

  _ProductScreenState(this.productData);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title, style: headingStyle),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.78,
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
                    style:
                        TextStyle(fontSize: getProportionateScreenWidth(18.0), fontWeight: FontWeight.bold),
                    maxLines: 3),
                Row(
                  children: [
                    Text(
                      "Apenas ",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18.0),
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    Text(
                      "R\$ ${productData.price.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18.0),
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.00,
                ),
                Text(
                  "Tamanho ",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height:  40.00,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5),
                    children: productData.sizes.map((s) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            size = s;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              border: Border.all(
                                  color: s == size
                                      ? kPrimaryColor
                                      : Colors.grey[500],
                                  width: 3.0)),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                DefaultButton(
                  text: UserModel.of(context).isLoggedIn()
                      ? "Adicionar ao carinho"
                      : "Entre para comprar",
                  press: size != null
                      ? () {
                          if (UserModel.of(context).isLoggedIn()) {
                            CartProduct cartProduct = CartProduct();
                            cartProduct.size = size;
                            cartProduct.quantity = 1;
                            cartProduct.pid = productData.id;
                            cartProduct.category = productData.category;
                            cartProduct.productData = productData;

                            CartModel.of(context).addCartItem(cartProduct);

                            //Redireciona diretamente ao rarinho
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CartScreen();
                                },
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WelcomeScreen();
                                },
                              ),
                            );
                          }
                        }
                      : null,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  productData.description,
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
