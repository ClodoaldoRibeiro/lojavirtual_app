import 'package:flutter/material.dart';
import 'package:lojavirtual_app/screens/welcome_screen.dart';

import 'default_button.dart';

class RequiredUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person_pin,
            size: 120.0,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Faça login para acompanhar...",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40.0,
          ),
          Column(
            children: [
              SizedBox(
                width: size.height * 0.48,
                child: DefaultButton(
                    text: "Entrar",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WelcomeScreen()));
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
