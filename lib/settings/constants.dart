import 'package:flutter/material.dart';
import 'size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor informe o seu e-mail";
const String kInvalidEmailError = "Digite um e-mail válido";
const String kPassNullError = "Por favor, insira sua senha";
const String kShortPassError = "A senha é muito curta";
const String kMatchPassError = "As senhas não conferem";
const String kNamelNullError = "Digite seu nome";
const String kPhoneNumberNullError = "Por favor, digite seu número de telefone";
const String kAddressNullError = "Por favor, digite seu endereço";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

// Corpdrão do gradiente da aplicação.
BoxDecoration boxDecoration() {
  return BoxDecoration(
      gradient: LinearGradient(colors: [
    Color.fromARGB(255, 211, 118, 130),
    Color.fromARGB(255, 253, 181, 168)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight));
}
