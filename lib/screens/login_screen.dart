import 'package:flutter/material.dart';
import 'package:lojavirtual_app/models/user_model.dart';
import 'package:lojavirtual_app/settings/constants.dart';
import 'package:lojavirtual_app/settings/size_config.dart';
import 'package:lojavirtual_app/widgets/default_button.dart';
import 'package:lojavirtual_app/widgets/rounded_input_field.dart';
import 'package:lojavirtual_app/widgets/rounded_password_field.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

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
                  SizedBox(height: size.height * 0.05),
                  Text(
                    "Fazer Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(22.0),
                        color: kPrimaryColor,
                        height: 1.5,
                        fontFamily: 'MuseoModerno'),
                  ),
                  SizedBox(height: size.height * 0.1),
                  SizedBox(
                    width: size.height * 0.48,
                    child: RoundedInputField(
                      controller: _emailController,
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Digite seu e-mail",
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
                      hintText: "Digite sua senha",
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "Senha inválida!";
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () {
                        if (_emailController.text.isEmpty) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                                "Informe seu e-mail para recuperar a senha"),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 4),
                          ));
                        } else {
                          model.recoverPass(_emailController.text);
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Confira seu e-mail!"),
                            backgroundColor: Theme.of(context).primaryColor,
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                      child: Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                            fontSize: 13.0,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.12),
                  SizedBox(
                    width: size.height * 0.48,
                    child: DefaultButton(
                      text: "Entrar",
                      press: () {
                        //Verifica se os dados fonecedios são válidos
                        if (_formKey.currentState.validate()) {
                          /// Autenticar no Google
                          model.signIn(
                              email: _emailController.text,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        )),
      ),
    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Erro ao efetuar login!"),
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
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/fundo_09.png",
                width: size.width * 1.0),
          ),
          child,
        ],
      ),
    );
  }
}
