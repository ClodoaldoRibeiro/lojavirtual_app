import 'package:flutter/material.dart';
import 'package:lojavirtual_app/screens/signup_screen.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/widgets/default_button.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.10),
            Text(
              "Seja bem-vindo!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(18.0),
                  color: kPrimaryColor,
                  height: 1.5,
                  fontFamily: 'MuseoModerno'),
            ),
            Text(
              "Loja Virtual",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(60.0),
                  color: kPrimaryColor,
                  height: 1.5,
                  fontFamily: 'MuseoModerno'),
            ),
            SizedBox(height: size.height * 0.22),
            SizedBox(
              width: size.height * 0.48,
              child: DefaultButton(
                text: "Login",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.035),
            SizedBox(
              width: size.height * 0.48,
              child: DefaultButton(
                text: "Cadastrar",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
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
            child: Image.asset("assets/images/fundo_09.png", width: size.width * 1.0),
          ),
          child,
        ],
      ),
    );
  }
}
