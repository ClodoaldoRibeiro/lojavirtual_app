import 'package:flutter/material.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:lojavirtual_app/screens/home_screen.dat.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/settings/theme.dart';
import 'package:lojavirtual_app/widgets/items_menu_drawer.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/cart_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        return ScopedModel<CartModel>(
          model: CartModel(model),
          child: MaterialApp(
            title: KNomeLoja,
            debugShowCheckedModeBanner: false,
            theme: theme(),
            home: HomeScreen(),
          ),
        );
      }),
    );
  }
}
