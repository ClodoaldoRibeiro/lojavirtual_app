import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/tabs/favorites_tab.dart';
import 'package:lojavirtual_app/tabs/home_tab.dart';
import 'package:lojavirtual_app/tabs/orders_tab.dart';
import 'package:lojavirtual_app/tabs/places_tab.dart';
import 'package:lojavirtual_app/tabs/products_tab.dart';
import 'package:lojavirtual_app/widgets/cart_button.dart';
import 'package:lojavirtual_app/widgets/items_menu_drawer.dart';
import 'package:lojavirtual_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  // PageController é que irá controlar a página ativa
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        //Page = Novidades
        menuInicio(),
        //Page = KProdutos
        menuProdutos(size),
        //Page = KMeusPedidos
        menuMeusPedidos(size),
        //Page = KMeusFavoritos
        menuMeusFavoritos(size),
        //Page = KEncontrarLojas
        menuEncontrarLojas(size),
      ],
    );
  }

  //Configura a imagem de fundo do sistema
  Positioned _background(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      child: Image.asset("assets/images/fundo_09.png", width: size.width * 1.0),
    );
  }

  //Retorna uma appbar padrão
  AppBar _appBarPadrao(String title) {
    return AppBar(
      title: Text(title, style: headingStyle),
      backgroundColor: kPrimaryColor,
      centerTitle: true,
    );
  }

  //Scaffold = Novidades
  Scaffold menuInicio() {
    return Scaffold(
      drawer: CustomDrawer(_pageController),
      body: HomeTab(),
      floatingActionButton: CartButton(),
    );
  }

  //Scaffold = KProdutos
  Scaffold menuProdutos(Size size) {
    return Scaffold(
        appBar: _appBarPadrao(KProdutos),
        drawer: CustomDrawer(_pageController),
        body: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //Fundo da aplicação
                _background(size),
                //Tab que irá exir os produtos
                ProductsTab(),
              ],
            )),
        floatingActionButton: CartButton());
  }

  //Scaffold = KMeusPedidos
  Scaffold menuMeusPedidos(Size size) {
    return Scaffold(
      appBar: _appBarPadrao(kMeusPedidos),
      drawer: CustomDrawer(_pageController),
      body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              //Fundo da aplicação
              _background(size),
              //Tab responsável por listar os pedido
              OrdersTab(),
            ],
          )),
      floatingActionButton: CartButton(),
    );
  }

  //Scaffold = KMeusFavoritos
  Scaffold menuMeusFavoritos(Size size) {
    return Scaffold(
        appBar: _appBarPadrao(KMeusFavoritos),
        drawer: CustomDrawer(_pageController),
        body: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //Fundo da aplicação
                _background(size),

                //Exibir tab de itens favoritos
                FavoritesTab(),
              ],
            )),
        floatingActionButton: CartButton());
  }

  //Scaffold = KEncontrarLojas
  Scaffold menuEncontrarLojas(Size size) {
    return Scaffold(
        appBar: _appBarPadrao(KEncontrarLojas),
        drawer: CustomDrawer(_pageController),
        body: Stack(
          alignment: Alignment.center,
          children: [
            //Fundo da aplicação
            _background(size),
            //Exibir tab de encontrar lojas
            PlacesTab(),
          ],
        ));
  }
}
