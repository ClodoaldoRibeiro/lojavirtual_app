import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            controller.jumpToPage(page);
          },
          child: Container(
            height: 60.0,
            child: Row(
              children: <Widget>[
                ///Icone de cada item do menu
                Icon(
                  icon,
                  size: 28.0,
                  color: controller.page.round() == page
                      ? Theme.of(context).primaryColor
                      : Colors.grey[700],
                ),

                /// Espaço entre o icone e o texto
                SizedBox(
                  width: 18.0,
                ),

                //Texto do menu da alicação
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: controller.page.round() == page
                        ? Theme.of(context).primaryColor
                        : Colors.grey[700],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
