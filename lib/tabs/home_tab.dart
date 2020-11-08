import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Novidades", style: headingStyle),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("home")
                  .orderBy("pos")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                else
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    staggeredTiles: snapshot.data.documents.map((doc) {
                      return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                    }).toList(),
                    children: snapshot.data.documents.map((doc) {
                      return Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.white38,
                        ),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: doc.data["image"],
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  );
              },
            )
          ]),
        ),
      ],
    );
  }

  // Montar o gradiente da aplicação.
  Widget _buildBodyBack() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: kPrimaryGradientColor.colors,
          begin: kPrimaryGradientColor.begin,
          end: kPrimaryGradientColor.end,
        ),
//        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}
