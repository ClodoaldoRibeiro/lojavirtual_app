import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/tabs/home_tab.dart';
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
        Scaffold(drawer: CustomDrawer(_pageController),
                body: HomeTab()),
      ],
    );
  }
}
