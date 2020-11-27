import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderId;

  OrderTile(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection("orders")
                .document(orderId)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                int status = snapshot.data["status"];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    dataOrder(snapshot),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Status do pedido",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildCircle("1", "Preparação", status, 1),
                        Container(
                          height: 1.0,
                          width: 40.0,
                          color: Colors.grey[500],
                        ),
                        _buildCircle("2", "Transporte", status, 2),
                        Container(
                          height: 1.0,
                          width: 40.0,
                          color: Colors.grey[500],
                        ),
                        _buildCircle("3", "Entrega", status, 3),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }

  Row dataOrder(AsyncSnapshot<DocumentSnapshot> snapshot) {
    return Row(
      children: [
        Center(
            child: Icon(
          Icons.shopping_bag_outlined,
          size: 90.0,
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Pedido: ",
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${snapshot.data.documentID}",
                  style: TextStyle(fontSize: 13.0),
                ),
              ],
            ),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Data: ",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${snapshot.data["data"].toDate()}",
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Produtos: ",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${snapshot.data["productsPrice"].toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Entrega: ",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${snapshot.data["shipPrice"].toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Preço Total: ",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${snapshot.data["totalPrice"].toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCircle(
      String title, String subtitle, int status, int thisStatus) {
    Color backColor;
    Widget child;

    if (status < thisStatus) {
      backColor = Colors.grey[500];
      child = Text(
        title,
        style: TextStyle(color: Colors.white),
      );
    } else if (status == thisStatus) {
      backColor = Colors.blue;
      child = Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        ],
      );
    } else {
      backColor = Colors.green;
      child = Icon(
        Icons.check,
        color: Colors.white,
      );
    }

    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: backColor,
          child: child,
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 11.0, fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}
