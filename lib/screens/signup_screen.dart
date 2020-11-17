import 'package:flutter/material.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/widgets/default_button.dart';
import 'package:lojavirtual_app/widgets/rounded_input_field.dart';
import 'package:lojavirtual_app/widgets/rounded_password_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoped_model/scoped_model.dart';

import 'home_screen.dat.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _passConfirmController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Background(
        child: SingleChildScrollView(child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.12),
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
                      controller: _nameController,
                      hintText: "Infome o nome completo",
                      onChanged: (value) {},
                      validator: (text) {
                        if (text.isEmpty) return "Informe seu nome!";
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.48,
                    child: RoundedInputField(
                      controller: _emailController,
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Informe seu e-mail",
                      onChanged: (value) {},
                      validator: (text) {
                        if (text.isEmpty || !text.contains("@"))
                          return "E-mail inválido!";
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.48,
                    child: RoundedPasswordField(
                      controller: _passController,
                      hintText: "Criar uma senha",
                      onChanged: (value) {},
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "Senha inválida!";
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.48,
                    child: RoundedPasswordField(
                      controller: _passConfirmController,
                      hintText: "Confirma sua senha",
                      onChanged: (value) {},
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "Cofirmação inválida!";
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.48,
                    child: RoundedInputField(
                      controller: _addressController,
                      icon: Icons.location_on_outlined,
                      hintText: "Infome o endereço",
                      onChanged: (value) {},
                      validator: (text) {
                        if (text.isEmpty) return "Informe o endereço!";
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.08),
                  SizedBox(
                    width: size.height * 0.48,
                    child: DefaultButton(
                      text: "Cadastrar",
                      press: () {
                        if (_formKey.currentState.validate()) {
                          Map<String, dynamic> userData = {
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "address": _addressController.text
                          };

                          model.signUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);
                        }
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
            );
          },
        )),
      ),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"),
      backgroundColor: kPrimaryColor,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 4),
    ));
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
