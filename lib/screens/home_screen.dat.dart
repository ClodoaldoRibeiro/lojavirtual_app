import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.orange,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.greenAccent,
        ),
        Container(
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}
