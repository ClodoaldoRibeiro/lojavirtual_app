import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/tiles/drawer_tile.dart';

import 'items_menu_drawer.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 210.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 40.0,
                      left: 0.0,
                      child: Text(
                        KNomeLoja,
                        style: TextStyle(
                          fontSize: 41.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          height: 1.5,
                          fontFamily: 'MuseoModerno',
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Olá",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Entre ou cadastre-se >",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home_outlined, kInicio, pageController, 0),
              DrawerTile(
                  Icons.list_alt_outlined, KProdutos, pageController, 1),
              DrawerTile(Icons.playlist_add_check_outlined, kMeusPedidos,
                  pageController, 2),
              DrawerTile(Icons.favorite_border_outlined, KMeusFavoritos,
                  pageController, 3),
              DrawerTile(Icons.location_on_outlined, KEncontrarLojas,
                  pageController, 4),
              DrawerTile(
                  Icons.phone_android_outlined, KContato, pageController, 5),
              DrawerTile(Icons.settings_applications_outlined, KConfiguracoes,
                  pageController, 6),
              Divider(),
              DrawerTile(Icons.exit_to_app_outlined, KSair, pageController, 7),
            ],
          )
        ],
      ),
    );
  }

  // Montar o gradiente da aplicação.
  Widget _buildDrawerBack() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: kCustomDrawerGradientColor.colors,
          begin: kCustomDrawerGradientColor.begin,
          end: kCustomDrawerGradientColor.end,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}
