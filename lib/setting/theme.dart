import 'package:flutter/material.dart';

const Color primaryColor = Colors.white;
const Color secoundaryColor = Color(0xFFE20038);
const Color tertiaryColor = Color(0xFF181818);
Color backgroundColor = Color(0xFF000000);
Color backgroundfadeColor = Color(0xFF131313);
const Color bananaColor = Color(0xFFFFE712);

const appTextPrimaryColor = Color(0xff1C1F34);
const appTextSecondaryColor = Color(0xff6C757D);
const cardColor = Color(0xFFF6F7F9);
const borderColor = Colors.white;

var gradientStyle = const LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.3, 0.8],
  colors: [
    primaryColor,
    secoundaryColor,
  ],
);

var gradientColors = [
  primaryColor,
  secoundaryColor,
];

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;
  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };
  return MaterialColor(color.value, shades);
}

class AppTheme {
  AppTheme(this.context);
  BuildContext context;
  InputDecoration textformfieldStyle({String? hintText, Widget? suffixIcon}) {
    return InputDecoration(
      filled: true,
      fillColor: tertiaryColor,
      hintText: hintText,
      hintStyle: TextStyle(
        color: primaryColor.withOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      border: InputBorder.none,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: primaryColor.withOpacity(0.2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: primaryColor.withOpacity(0.8),
        ),
      ),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    );
  }

  InputDecoration textformfieldStyle2({String? hintText, Widget? suffixIcon}) {
    return InputDecoration(
      filled: true,
      fillColor: tertiaryColor,
      hintText: hintText,
      hintStyle: TextStyle(color: primaryColor.withOpacity(0.2)),
      border: InputBorder.none,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    );
  }
}

enum FontFamily { SFPro, SFProBold, SFProSemiBold, SFProMedium, SFProRegular }
