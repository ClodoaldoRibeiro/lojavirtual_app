import 'package:flutter/material.dart';
import 'package:lojavirtual_app/screens/home_screen.dat.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/widgets/default_button.dart';
import 'package:lojavirtual_app/widgets/rounded_input_field.dart';
import 'package:lojavirtual_app/widgets/rounded_password_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.15),
            Text(
              "Registra-me",
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
                hintText: "Infome o nome completo",
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: size.height * 0.48,
              child: RoundedInputField(
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                hintText: "Informe seu e-mail",
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: size.height * 0.48,
              child: RoundedPasswordField(
                hintText: "Criar uma senha",
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: size.height * 0.48,
              child: RoundedPasswordField(
                hintText: "Confirma sua senha",
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: size.height * 0.08),
            SizedBox(
              width: size.height * 0.48,
              child: DefaultButton(
                text: "Cadastrar",
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
            SizedBox(height: size.height * 0.05),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
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
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/fundo_09.png",
              width: size.width * 1.0,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Login com",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
}

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;

  const SocalIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
