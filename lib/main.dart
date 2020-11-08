import 'package:flutter/material.dart';
import 'package:lojavirtual_app/screens/home_screen.dat.dart';
import 'package:lojavirtual_app/settings/theme.dart';
import 'package:lojavirtual_app/widgets/Items_menu_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KNomeLoja,
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: HomeScreen(),
    );
  }
}
