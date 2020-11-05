import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtual_app/screens/home_screen.dat.dart';
import 'package:lojavirtual_app/settings/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja Virtual',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: HomeScreen(),
    );
  }
}
