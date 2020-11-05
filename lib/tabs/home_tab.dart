import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/constants.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Novidades"),
              centerTitle: true,
            ),
          ),
        ]),
      ],
    );
  }

  Widget _buildBodyBack() {
    return Container(
      decoration: boxDecoration(),
    );
  }
}
