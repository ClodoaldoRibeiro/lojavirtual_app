import 'package:flutter/material.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/widgets/default_button.dart';
import 'package:lojavirtual_app/widgets/rounded_input_field.dart';
import 'package:lojavirtual_app/widgets/rounded_password_field.dart';

import 'home_screen.dat.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Fazer Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(22.0),
                  color: kPrimaryColor,
                  height: 1.5,
                  fontFamily: 'MuseoModerno'),
            ),
            SizedBox(height: size.height * 0.05),
            SizedBox(
              width: size.height * 0.48,
              child: RoundedInputField(
                hintText: "Digite o e-mail",
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: size.height * 0.48,
              child: RoundedPasswordField(),
            ),
            SizedBox(height: size.height * 0.1),
            SizedBox(
              width: size.height * 0.48,
              child: DefaultButton(
                text: "Entrar",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("images/fundo_09.png", width: size.width * 1.0),
          ),
          child,
        ],
      ),
    );
  }
}
