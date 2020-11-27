import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/tabs/home_tab.dart';
import 'package:lojavirtual_app/tabs/orders_tab.dart';
import 'package:lojavirtual_app/tabs/products_tab.dart';
import 'package:lojavirtual_app/widgets/cart_button.dart';
import 'package:lojavirtual_app/widgets/items_menu_drawer.dart';
import 'package:lojavirtual_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
//    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        //Scaffold = Novidades
        Scaffold(
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
          floatingActionButton: CartButton(),
        ),

        //Scaffold = KProdutos
        Scaffold(
            appBar: AppBar(
              title: Text(KProdutos, style: headingStyle),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: Container(
                height: size.height,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset("assets/images/fundo_09.png",
                          width: size.width * 1.0),
                    ),

                    //Tab que irá exir os produtos
                    ProductsTab(),
                  ],
                )),
            floatingActionButton: CartButton()),

        //Scaffold = KMeusPedidos
        Scaffold(
            appBar: AppBar(
              title: Text(kMeusPedidos, style: headingStyle),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: Container(
                height: size.height,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset("assets/images/fundo_09.png",
                          width: size.width * 1.0),
                    ),

                    //Tab responsável por listar os pedido
                    OrdersTab(),
                  ],
                ))),

        //Scaffold = KMeusFavoritos
        Scaffold(
            appBar: AppBar(
              title: Text(KMeusFavoritos, style: headingStyle),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: Container(
                height: size.height,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset("assets/images/fundo_09.png",
                          width: size.width * 1.0),
                    ),
                  ],
                )),
            floatingActionButton: CartButton()),

        //Scaffold = KEncontrarLojas
        Scaffold(
            appBar: AppBar(
              title: Text(KEncontrarLojas, style: headingStyle),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: Container(
              color: Colors.white,
            )),

        //Scaffold = KContato
        Scaffold(
            appBar: AppBar(
              title: Text(KContato, style: headingStyle),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: Container(
              color: Colors.white,
            )),

        //Scaffold = KConfiguracoes
        Scaffold(
            appBar: AppBar(
              title: Text(KConfiguracoes, style: headingStyle),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: Container(
              color: Colors.white,
            )),
        //Scaffold = KConfiguracoes
      ],
    );
  }
}
