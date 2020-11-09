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
            body: ProductsTab()),

        //Scaffold = KMeusPedidos
        Scaffold(
            appBar: AppBar(
              title: Text(kMeusPedidos, style: headingStyle),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: Container(
              color: Colors.white,
            )),

        //Scaffold = KMeusFavoritos
        Scaffold(
            appBar: AppBar(
              title: Text(KMeusFavoritos, style: headingStyle),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: Container(
              color: Colors.white,
            )),

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
