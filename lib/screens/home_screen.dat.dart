import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/tabs/home_tab.dart';
import 'package:lojavirtual_app/tabs/products_tab.dart';
import 'package:lojavirtual_app/widgets/Items_menu_drawer.dart';
import 'package:lojavirtual_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        //Scaffold = Novidades
        Scaffold(drawer: CustomDrawer(_pageController), body: HomeTab()),

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
                      child: Image.asset("images/fundo_04.jpg",
                          width: size.width * 1.0),
                    ),
                    ProductsTab(),
                  ],
                ))),

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
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset("images/fundo_09.png",
                          width: size.width * 1.0),
                    ),
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
                      child: Image.asset("images/fundo_11.png",
                          width: size.width * 1.0),
                    ),
                  ],
                ))),

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
      ],
    );
  }
}
