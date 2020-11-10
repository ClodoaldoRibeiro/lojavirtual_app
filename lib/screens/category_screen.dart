import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/widgets/Items_menu_drawer.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen(this.documentSnapshot);

  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(documentSnapshot.data["title"], style: headingStyle),
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(
                  icon: Icon(Icons.list),
                )
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                color: Colors.white,
              ),
              Container(
                color: Colors.black12,
              ),
            ],
          ),
        ));
  }
}
